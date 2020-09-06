package kr.ac.kopo.banking.vo;

public class BankingVO {

	private String id;
	private String withdrawAccNo;	// 내계좌
	private String accPwd;
	private String money;
	private String depositAccNo;	// 상대계좌
	
	public BankingVO() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWithdrawAccNo() {
		return withdrawAccNo;
	}

	public void setWithdrawAccNo(String withdrawAccNo) {
		this.withdrawAccNo = withdrawAccNo;
	}

	public String getAccPwd() {
		return accPwd;
	}

	public void setAccPwd(String accPwd) {
		this.accPwd = accPwd;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getDepositAccNo() {
		return depositAccNo;
	}

	public void setDepositAccNo(String depositAccNo) {
		this.depositAccNo = depositAccNo;
	}

	@Override
	public String toString() {
		return "BangkingVO [id=" + id + ", withdrawAccNo=" + withdrawAccNo + ", accPwd=" + accPwd + ", money=" + money
				+ ", depositAccNo=" + depositAccNo + "]";
	}

}
