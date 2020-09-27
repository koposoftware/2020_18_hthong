package kr.ac.kopo.report.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import java.util.Base64;
import java.util.Date;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.ac.kopo.product.vo.ProductVO;
import kr.ac.kopo.report.dao.ReportDAO;
import kr.ac.kopo.report.vo.ReportVO;

//@Service("dailyReport")
@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDAO reportDAO;
	
	
	/**
	 * tts 파일경로 조회
	 */
	@Override
	public ReportVO ttsPathByAcc(ProductVO onepickInfo) {
		ReportVO ttsPathList = reportDAO.ttsPathByAcc(onepickInfo);
		return ttsPathList;
	}

	/**
	 * 데일리 리포트 실행(파일업로드, 문자발송)
	 */
	@Override
	public void dailyReportExecute() {

		String name = "";
		String mobile = "";	
		
		// 데일리 리포트 보낼 계좌리스트 확인
		List<ReportVO> ttsPathList = reportDAO.ttsPathList();
		

		// 데일리 리포트 보낼 계좌있는 경우
		if (ttsPathList != null) {
			int i = 0;
			
			// 계좌 수만큼 문자발송
			while (i < ttsPathList.size()) {
				try {
					// 고객 이름, 폰 번호 
					name = ttsPathList.get(i).getName();
					mobile = ttsPathList.get(i).getMobile();
					
					// 휴대폰 번호 수동 설정
					mobile = "010-9276-8500";
					
					String charsetType = "UTF-8"; // EUC-KR 또는 UTF-8

					System.out.println("check in service");
					String action = "go";
					if (action.equals("go")) {

						String sms_url = "";
						sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
						String user_id = base64Encode("kkcda92"); // SMS아이디
						String secure = base64Encode("f0b2ed1b2086e1488167183d1fb01c5a");// 인증키

						// 전화번호 설정부분
						String msg = base64Encode("[하나은행] 오늘의 금융브리핑이 도착했습니다. 지금 바로 확인해보세요!"
								+ "    http://localhost:9999/product/report/briefing"); // 메시지 작성부분
						String rphone = base64Encode(mobile); // 수신번호
						String sphone1 = base64Encode("010"); // 발신번호1
						String sphone2 = base64Encode("9276"); // 발신번호2
						String sphone3 = base64Encode("8500"); // 발신번호3
						String rdate = base64Encode(""); // 예약일자
						String rtime = base64Encode(""); // 예약시간
						String mode = base64Encode("1");
						String subject = "";
						String testflag = base64Encode("");
						String destination = base64Encode("");
						String repeatFlag = base64Encode("");
						String repeatNum = base64Encode("");
						String repeatTime = base64Encode("");
						String returnurl = "";
						String nointeractive = "";
						String smsType = base64Encode("L"); // 단문/장문 문자 설정(L 기본값 설정)

						String[] host_info = sms_url.split("/");
						String host = host_info[2];
						String path = "/" + host_info[3];
						int port = 80;

						// 데이터 맵핑 변수 정의
						String arrKey[] = new String[] { "user_id", "secure", "msg", "rphone", "sphone1", "sphone2",
								"sphone3", "rdate", "rtime", "mode", "testflag", "destination", "repeatFlag",
								"repeatNum", "repeatTime", "smsType", "subject" };
						String valKey[] = new String[arrKey.length];
						valKey[0] = user_id;
						valKey[1] = secure;
						valKey[2] = msg;
						valKey[3] = rphone;
						valKey[4] = sphone1;
						valKey[5] = sphone2;
						valKey[6] = sphone3;
						valKey[7] = rdate;
						valKey[8] = rtime;
						valKey[9] = mode;
						valKey[10] = testflag;
						valKey[11] = destination;
						valKey[12] = repeatFlag;
						valKey[13] = repeatNum;
						valKey[14] = repeatTime;
						valKey[15] = smsType;
						valKey[16] = subject;

						String boundary = "";
						Random rnd = new Random();
						String rndKey = Integer.toString(rnd.nextInt(32000));
						MessageDigest md = MessageDigest.getInstance("MD5");
						byte[] bytData = rndKey.getBytes();
						md.update(bytData);
						byte[] digest = md.digest();
						for (int j = 0; j < digest.length; j++) {
							boundary = boundary + Integer.toHexString(digest[j] & 0xFF);
						}
						boundary = "---------------------" + boundary.substring(0, 11);

						// 본문 생성
						String data = "";
						String index = "";
						String value = "";
						for (int j = 0; j < arrKey.length; j++) {
							index = arrKey[j];
							value = valKey[j];
							data += "--" + boundary + "\r\n";
							data += "Content-Disposition: form-data; name=\"" + index + "\"\r\n";
							data += "\r\n" + value + "\r\n";
							data += "--" + boundary + "\r\n";
						}

						// out.println(data);
						System.out.println("data check : " + data);

						InetAddress addr = InetAddress.getByName(host);
						Socket socket = new Socket(host, port);
						// 헤더 전송
						BufferedWriter wr = new BufferedWriter(
								new OutputStreamWriter(socket.getOutputStream(), charsetType));
						wr.write("POST " + path + " HTTP/1.0\r\n");
						wr.write("Content-Length: " + data.length() + "\r\n");
						wr.write("Content-type: multipart/form-data, boundary=" + boundary + "\r\n");
						wr.write("\r\n");

						// 데이터 전송
						wr.write(data);
						wr.flush();

						// 결과값 얻기
						BufferedReader rd = new BufferedReader(
								new InputStreamReader(socket.getInputStream(), charsetType));
						String line;
						String alert = "";
						ArrayList<String> tmpArr = new ArrayList<String>();
						while ((line = rd.readLine()) != null) {
							tmpArr.add(line);
						}
						wr.close();
						rd.close();

						String tmpMsg = (String) tmpArr.get(tmpArr.size() - 1);
						String[] rMsg = tmpMsg.split(",");
						String Result = rMsg[0]; // 발송결과
						String Count = ""; // 잔여건수
						if (rMsg.length > 1) {
							Count = rMsg[1];
						}

						// 발송결과 알림
						if (Result.equals("success")) {
							System.out.println("성공적으로 발송하였습니다.");
							System.out.println(" 잔여건수는 " + Count + "건 입니다.");
						} else if (Result.equals("reserved")) {
							System.out.println("성공적으로 예약되었습니다");
							System.out.println(" 잔여건수는 " + Count + "건 입니다.");
						} else if (Result.equals("3205")) {
							System.out.println("잘못된 번호형식입니다.");
						} else {
							System.out.println("[Error]" + Result);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}

//////////////////////////////////////////////////////////////////////////////////////
//문자전송///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

	@Override
	public void sendMessage() {
	}

	public static String nullcheck(String str, String Defaultvalue) throws Exception {
		String ReturnDefault = "";
		if (str == null) {
			ReturnDefault = Defaultvalue;
		} else if (str == "") {
			ReturnDefault = Defaultvalue;
		} else {
			ReturnDefault = str;
		}
		return ReturnDefault;
	}

	/**
	 * BASE64 Encoder
	 * 
	 * @param str
	 * @return
	 */
	public static String base64Encode(String str) throws java.io.IOException {
		Encoder encoder = Base64.getEncoder();
		byte[] strByte = str.getBytes("UTF-8");
		String result = encoder.encodeToString(strByte);
		return result;
	}

	/**
	 * BASE64 Decoder
	 * 
	 * @param str
	 * @return
	 */
	public static String base64Decode(String str) throws java.io.IOException {
		Decoder decoder = Base64.getDecoder();
		byte[] strByte = decoder.decode

		(str);
		String result = new String(strByte);
		return result;
	}
}
