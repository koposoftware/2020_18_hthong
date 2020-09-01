package kr.ac.kopo.autodebit.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.autodebit.dao.AutoDebitDAO;
import kr.ac.kopo.autodebit.vo.AutoDebitVO;

@Service("autoDebitExecute")
public class AutoDebitServiceImpl implements AutoDebitService {

	@Autowired
	private AutoDebitDAO autoDebitDAO;

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
		String setMoney = "";
		String oppAccNo = "";
		String autodebitCode = "";

		List<AutoDebitVO> autoDebitInfo = autoDebitDAO.selectByDate(); // 당일 자동이체 계좌정보(계좌번호, 이체금액) 객체

		System.out.println("자동이체할 계좌정보 객체 확인 : " + autoDebitInfo);

		// 3. AutoDebit Execute(자동이체 실행)

		// 당일 자동이체할 계좌가 있는 경우
		if (autoDebitInfo != null) {
			int i = 0;

			// 자동이체할 계좌 수만큼 돌거임
			while (i < autoDebitInfo.size()) {

				// 여기에서 UPDATE 구문 실행 -> i번째 돌때,
				// 출금계좌 execute 실행(accNo, setMoney 매개변수)
				// 입금계좌 execute 실행(opp_acc_no, setMoney 매개변수)
				// 자동이체 테이블 last_run_date 업데이트 실행(autodebit_code 매개변수)

				try {

					AutoDebitVO autoDebitVO = new AutoDebitVO();
					autoDebitVO.setAccNo(accNo);
					autoDebitVO.setSetMoney(setMoney);
					autoDebitVO.setOppAccNo(oppAccNo);
					autoDebitVO.setAutodebitCode(autodebitCode);

					// 당일 자동이체 계좌번호, 금액, 상대계좌, 자동이체 고유번호
					accNo = autoDebitInfo.get(i).getAccNo();
					setMoney = autoDebitInfo.get(i).getSetMoney();
					oppAccNo = autoDebitInfo.get(i).getOppAccNo();
					autodebitCode = autoDebitInfo.get(i).getAutodebitCode();

					// 3-1. UPDATE EXECUTE 실행(출금계좌)
					autoDebitDAO.autoDebitSend(autoDebitVO);

					// 3-2. UPDATE EXECUTE 실행(출금계좌)
					autoDebitDAO.autoDebitReceive(autoDebitVO);

					System.out.println("자동이체 조건 맞는 계좌번호 : " + accNo);
					System.out.println("자동이체 금액 : " + setMoney);
					System.out.println("자동이체 상대계좌 : " + oppAccNo);
					System.out.println(i + "=======================================");

					// 4. 자동이체 시 거래내역 로그 남기기

					// 5. 자동이체 마지막 거래일 업데이트
					autoDebitDAO.lastRunDate(autoDebitVO);

					i++;

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
