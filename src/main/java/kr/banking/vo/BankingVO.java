package kr.ac.kopo.banking.vo;

public class BankingVO {

	private String id;
	private String accNo; // 내계좌
	private String accPwd;
	private String money;
	private String oppAccNo; // 상대계좌
	private String summary;
	private String memo;

	private String chkBalance;
	private String bankName;

	public BankingVO() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
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

	public String getOppAccNo() {
		return oppAccNo;
	}

	public void setOppAccNo(String oppAccNo) {
		this.oppAccNo = oppAccNo;
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

	public String getChkBalance() {
		return chkBalance;
	}

	public void setChkBalance(String chkBalance) {
		this.chkBalance = chkBalance;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	@Override
	public String toString() {
		return "BankingVO [id=" + id + ", accNo=" + accNo + ", accPwd=" + accPwd + ", money=" + money + ", oppAccNo="
				+ oppAccNo + ", summary=" + summary + ", memo=" + memo + ", chkBalance=" + chkBalance + ", bankName="
				+ bankName + "]";
	}

}
