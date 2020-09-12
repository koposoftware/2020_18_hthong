package kr.ac.kopo.account.vo;

public class AccountVO {
	private String id;
	private int bankCode;
	private String accNo;
	private int accPwd;
	private int balance;
	private String accType;
	private String accName;
	private String nickname;
	private String regDate;
	private String holder;

	public AccountVO() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBankCode() {
		return bankCode;
	}

	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public int getAccPwd() {
		return accPwd;
	}

	public void setAccPwd(int accPwd) {
		this.accPwd = accPwd;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getAccType() {
		return accType;
	}

	public void setAccType(String accType) {
		this.accType = accType;
	}

	public String getAccName() {
		return accName;
	}

	public void setAccName(String accName) {
		this.accName = accName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getHolder() {
		return holder;
	}

	public void setHolder(String holder) {
		this.holder = holder;
	}

	@Override
	public String toString() {
		return "AccountVO [id=" + id + ", bankCode=" + bankCode + ", accNo=" + accNo + ", accPwd=" + accPwd
				+ ", balance=" + balance + ", accType=" + accType + ", accName=" + accName + ", nickname=" + nickname
				+ ", regDate=" + regDate + ", holder=" + holder + "]";
	}

}
