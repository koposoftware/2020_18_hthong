package kr.ac.kopo.banking.vo;

public class PayingVO {
	private String accNo; 		// 체크카드 연결계좌
	private String summary;		// 구분 - 체크하나
	private String memo;		// 가맹점명
	private String money;		// 결제금액
	private String oppAccNo;	// 체크카드는 card로 기록

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getOppAccNo() {
		return oppAccNo;
	}

	public void setOppAccNo(String oppAccNo) {
		this.oppAccNo = oppAccNo;
	}

	@Override
	public String toString() {
		return "PayingVO [accNo=" + accNo + ", summary=" + summary + ", memo=" + memo + ", money=" + money
				+ ", oppAccNo=" + oppAccNo + "]";
	}

}
