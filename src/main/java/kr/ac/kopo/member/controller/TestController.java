package kr.ac.kopo.member.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@SuppressWarnings("deprecation")
@RestController
public class TestController {

	@PostMapping("/sendSMS")
	public String sendSMS(String receiver) {

		String hostname = "api.bluehouselab.com";
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";

		CredentialsProvider credsProvider = new BasicCredentialsProvider();

		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM),
				new UsernamePasswordCredentials("", ""));

		// Create AuthCache instance
		AuthCache authCache = new BasicAuthCache();
		authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

		// Add AuthCache to the execution context
		HttpClientContext context = HttpClientContext.create();
		context.setCredentialsProvider(credsProvider);
		context.setAuthCache(authCache);

		DefaultHttpClient client = new DefaultHttpClient();

		try {
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Content-type", "application/json; charset=utf-8");

			String json = "{\"sender\":\"" + "010" + "\",\"receivers\":[\"" + "01092768500"
					+ "\"],\"content\":\"" + "보낼 내용" + "\"}";

			StringEntity se = new StringEntity(json, "UTF-8");
			httpPost.setEntity(se);

			HttpResponse httpResponse = client.execute(httpPost, context);

			/////
			System.out.println("check :" + httpResponse.getStatusLine().getStatusCode());

			InputStream inputStream = httpResponse.getEntity().getContent();
			
			if (inputStream != null) {
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				String line = "";
				
				System.out.println("step1 : " + bufferedReader.readLine());
				
				while ((line = bufferedReader.readLine()) != null)
					System.out.println("line" + line);

				inputStream.close();
			}
		} catch (Exception e) {
			System.err.println("Error: " + e.getLocalizedMessage());
		} finally {
			client.getConnectionManager().shutdown();
		}
		return "ok";
	}
}
