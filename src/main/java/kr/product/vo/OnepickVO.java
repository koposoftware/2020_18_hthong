package kr.ac.kopo.product.vo;

// 원픽통장용 transaction vo
public class OnepickVO {
	private String accNo; // 원픽 계좌번호
	private String sender; // 보내는 통장
	private String receiver; // 받는 통장
	private String money; // 금액
	private String memo; // 메모
	private String columnParam; // 컬렴명(동적 쿼리)

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getColumnParam() {
		return columnParam;
	}

	public void setColumnParam(String columnParam) {
		this.columnParam = columnParam;
	}

	@Override
	public String toString() {
		return "OnepickVO [accNo=" + accNo + ", sender=" + sender + ", receiver=" + receiver + ", money=" + money
				+ ", memo=" + memo + ", columnParam=" + columnParam + "]";
	}

}
