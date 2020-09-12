package kr.ac.kopo.autodebit.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.autodebit.dao.AutoDebitDAO;
import kr.ac.kopo.autodebit.vo.AutoDebitVO;

@Service("autoDebitExecute")
public class AutoDebitServiceImpl implements AutoDebitService {

	@Autowired
	private AutoDebitDAO autoDebitDAO;
	
	/**
	 * 자동이체 전체조회
	 */
	@Override
	public List<AutoDebitVO> autoDebitList(AutoDebitVO autoDebitVO) {
		List<AutoDebitVO> autodebitList = autoDebitDAO.autodebitList(autoDebitVO);
		return autodebitList;
	}

	/**
	 * 자동이체 조건조회
	 */
	@Override
	public List<AutoDebitVO> selectByCategry(AutoDebitVO autoDebitVO) {
		List<AutoDebitVO> autodebitList = autoDebitDAO.selectByCategry(autoDebitVO);
		return autodebitList;
	}

	/**
	 * 자동이체 등록
	 */
	@Override
	public int autoDebitReg(AutoDebitVO autoDebitVO) {
		int chkResult = autoDebitDAO.autoDebitReg(autoDebitVO);
		return chkResult;
	}

	/**
	 * 자동이체 삭제
	 */
	@Override
	public int autoDebitDelete(AutoDebitVO autoDebitVO) {
		int result = autoDebitDAO.autoDebitDelete(autoDebitVO);
		return result;
	}

	/**
	 * 자동이체 변경
	 */
	@Override
	public int autoDebitModify(AutoDebitVO autoDebitVO) {
		int result = autoDebitDAO.autoDebitModify(autoDebitVO);
		return result;
	}

	////////////////////////////////////////////////////////////////////////////////////////////
	// 자동이체 실행로직
	////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 자동이체 실행 로직
	 */
	@Transactional
	@Override
	public void autoDebitExecute() {

		// 0. 날짜포멧 - 지정일 이체를 위해 오늘 일자만 리턴
		SimpleDateFormat format = new SimpleDateFormat("dd");
		Date date = new Date();

		// 1. 자동이체용 당일 날짜 출력(DD값만)
		String systemDate = format.format(date); // 오늘 일자
		System.out.println("Test job...." + systemDate);

		// 2. 자동이체 조건 쿼리
		String accNo = "";
		String category = "";
		String setMoney = "";
		String oppAccNo = "";
		String autodebitCode = "";
		String summary = "";
		String memo ="";

		List<AutoDebitVO> autoDebitInfo = autoDebitDAO.selectByDate(); // 당일 자동이체 계좌정보(계좌번호, 이체금액) 객체

		System.out.println("자동이체할 계좌정보 객체 확인 : " + autoDebitInfo);

		// 3. AutoDebit Execute(자동이체 실행)
		// 당일 자동이체할 계좌가 있는 경우
		if (autoDebitInfo != null) {
			int i = 0;

			// 자동이체할 계좌 수만큼 반복
			while (i < autoDebitInfo.size()) {

				// 여기에서 UPDATE 구문 실행 -> i번째 돌때,
				// 출금계좌 execute 실행(accNo, setMoney 매개변수)
				// 입금계좌 execute 실행(opp_acc_no, setMoney 매개변수)
				// 자동이체 테이블 last_run_date 업데이트 실행(autodebit_code 매개변수)

				try {
					AutoDebitVO autoDebitVO = new AutoDebitVO();

					// 당일 자동이체 계좌번호, 금액, 상대계좌, 자동이체 고유번호
					accNo = autoDebitInfo.get(i).getAccNo();
					category = autoDebitInfo.get(i).getCategory();
					setMoney = autoDebitInfo.get(i).getSetMoney();
					oppAccNo = autoDebitInfo.get(i).getOppAccNo();
					autodebitCode = autoDebitInfo.get(i).getAutodebitCode();
					memo = "자동이체";

					autoDebitVO.setAccNo(accNo);
					autoDebitVO.setCategory(category);
					autoDebitVO.setSetMoney(setMoney);
					autoDebitVO.setOppAccNo(oppAccNo);
					autoDebitVO.setAutodebitCode(autodebitCode);
					autoDebitVO.setMemo(memo);
					
					System.out.println("service2 : " + autoDebitVO.toString());

					// 3-1. UPDATE EXECUTE 실행(출금계좌)
					autoDebitDAO.autoDebitSend(autoDebitVO);

					// 3-2. UPDATE EXECUTE 실행(입금계좌)
					autoDebitDAO.autoDebitReceive(autoDebitVO);

					System.out.println("자동이체 조건 맞는 계좌번호 : " + accNo);
					System.out.println("자동이체 금액 : " + setMoney);
					System.out.println("자동이체 상대계좌 : " + oppAccNo);
					System.out.println(i + "=======================================");

					// 4-1. 자동이체 시 거래내역 로그(출금계좌)
					autoDebitVO.setSummary("자동출금");
					autoDebitDAO.sendAutoTrans(autoDebitVO);

					// 4-2. 자동이체 시 거래내역 로그(입금계좌)
					autoDebitVO.setSummary("자동입금");
					autoDebitDAO.receiveAutoTrans(autoDebitVO);

					// 5. 자동이체 마지막 거래일 업데이트
					autoDebitDAO.lastRunDate(autoDebitVO);
					
					
					
					
					// 6. 자동이체 완료시 문자알림 전송
					String charsetType = "UTF-8"; // EUC-KR 또는 UTF-8
					
					System.out.println("check in service");
					String action = "go";
					if (action.equals("go")) {

						String sms_url = "";
						sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
						String user_id = base64Encode("kkcda92"); // SMS아이디
						String secure = base64Encode("f0b2ed1b2086e1488167183d1fb01c5a");// 인증키

						//문자 발송용 당일 날짜 출력(DD값만)
						SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd");
						String setDate = dateFormat.format(date); // 오늘 일자
						
						// 전화번호 설정부분
						String msg = base64Encode("[하나은행] 고객님, " + "\n" + setDate +"에 하나은행 계좌 [" + accNo + "]에서 " + setMoney +" 원이 ["+ oppAccNo +"] 으로 자동이체 되었습니다. 자동이체 변경/조회를 원하시면 홈페이지를 방문해주세요.");		// 메시지 작성부분
						String rphone = base64Encode("010-9276-8500");	// 수신번호
						String sphone1 = base64Encode("010");			// 발신번호1
						String sphone2 = base64Encode("9276");			// 발신번호2
						String sphone3 = base64Encode("8500");			// 발신번호3
						String rdate = base64Encode("");				// 예약일자
						String rtime = base64Encode("");				// 예약시간
						String mode = base64Encode("1");				
						String subject = "";
						String testflag = base64Encode("");
						String destination = base64Encode("");
						String repeatFlag = base64Encode("");
						String repeatNum = base64Encode("");
						String repeatTime = base64Encode("");
						String returnurl = "";
						String nointeractive = "";
						String smsType = base64Encode("L");				// 단문/장문 문자 설정(L 기본값 설정)

						String[] host_info = sms_url.split("/");
						String host = host_info[2];
						String path = "/" + host_info[3];
						int port = 80;

						// 데이터 맵핑 변수 정의
						String arrKey[] = new String[] { "user_id", "secure", "msg", "rphone", "sphone1", "sphone2", "sphone3",
								"rdate", "rtime", "mode", "testflag", "destination", "repeatFlag", "repeatNum", "repeatTime",
								"smsType", "subject" };
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
						BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
						wr.write("POST " + path + " HTTP/1.0\r\n");
						wr.write("Content-Length: " + data.length() + "\r\n");
						wr.write("Content-type: multipart/form-data, boundary=" + boundary + "\r\n");
						wr.write("\r\n");

						// 데이터 전송
						wr.write(data);
						wr.flush();

						// 결과값 얻기
						BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(), charsetType));
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
					
					i++;

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

		// 발신번호, 수신번호, 내용 세팅
		/**
		 * ============================================================== Description :
		 * 사용 함수 선언 ==============================================================
		 **/
		/**
		 * nullcheck
		 * 
		 * @param str, Defaultvalue
		 * @return
		 */
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
