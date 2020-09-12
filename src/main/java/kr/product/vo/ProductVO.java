package kr.ac.kopo.product.vo;

public class ProductVO {
	private String userId;
	private String accNo; // 원픽 계좌번호(account 테이블 계좌번호와 동일)
	private String baseAccNo; // 기본금 가상계좌번호
	private String livingAccNo; // 생활비 가상계좌번호
	private String extraAccNo; // 예비금 가상계좌번호
	private String baseBudget; // 기본금 설정 예산
	private String livingBudget; // 생활비 설정 예산
	private String extraBudget; // 예비금 설정 예산
	private String totalBudget; // 사용자 설정 예산

	private String accName; // 통장명
	private String bankName; // 은행명
	private String balance; // 잔액
	private String regDate; // 신규일

	private String flag; // ajax 판단
	private String autodebitCode; // 원픽 자동이동 코드
	private String moneyToLiving; // 생활비로 자동입금할 금액
	private String moneyToExtra; // 예비금으로 자동입금할 금액
	private String dateToLiving; // 생활비로 자동입금할 날짜
	private String dateToExtra; // 예비금로 자동입금할 날짜

	private String baseMoney; // 기본금
	private String livingCost; // 생활비
	private String extraMoney; // 예비금

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getBaseAccNo() {
		return baseAccNo;
	}

	public void setBaseAccNo(String baseAccNo) {
		this.baseAccNo = baseAccNo;
	}

	public String getLivingAccNo() {
		return livingAccNo;
	}

	public void setLivingAccNo(String livingAccNo) {
		this.livingAccNo = livingAccNo;
	}

	public String getExtraAccNo() {
		return extraAccNo;
	}

	public void setExtraAccNo(String extraAccNo) {
		this.extraAccNo = extraAccNo;
	}

	public String getTotalBudget() {
		return totalBudget;
	}

	public void setTotalBudget(String totalBudget) {
		this.totalBudget = totalBudget;
	}

	public String getBaseMoney() {
		return baseMoney;
	}

	public void setBaseMoney(String baseMoney) {
		this.baseMoney = baseMoney;
	}

	public String getLivingCost() {
		return livingCost;
	}

	public void setLivingCost(String livingCost) {
		this.livingCost = livingCost;
	}

	public String getExtraMoney() {
		return extraMoney;
	}

	public void setExtraMoney(String extraMoney) {
		this.extraMoney = extraMoney;
	}

	public String getAccName() {
		return accName;
	}

	public void setAccName(String accName) {
		this.accName = accName;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getAutodebitCode() {
		return autodebitCode;
	}

	public void setAutodebitCode(String autodebitCode) {
		this.autodebitCode = autodebitCode;
	}

	public String getMoneyToLiving() {
		return moneyToLiving;
	}

	public void setMoneyToLiving(String moneyToLiving) {
		this.moneyToLiving = moneyToLiving;
	}

	public String getMoneyToExtra() {
		return moneyToExtra;
	}

	public void setMoneyToExtra(String moneyToExtra) {
		this.moneyToExtra = moneyToExtra;
	}

	public String getDateToLiving() {
		return dateToLiving;
	}

	public void setDateToLiving(String dateToLiving) {
		this.dateToLiving = dateToLiving;
	}

	public String getDateToExtra() {
		return dateToExtra;
	}

	public void setDateToExtra(String dateToExtra) {
		this.dateToExtra = dateToExtra;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getBaseBudget() {
		return baseBudget;
	}

	public void setBaseBudget(String baseBudget) {
		this.baseBudget = baseBudget;
	}

	public String getLivingBudget() {
		return livingBudget;
	}

	public void setLivingBudget(String livingBudget) {
		this.livingBudget = livingBudget;
	}

	public String getExtraBudget() {
		return extraBudget;
	}

	public void setExtraBudget(String extraBudget) {
		this.extraBudget = extraBudget;
	}

	
	
	@Override
	public String toString() {
		return "ProductVO [userId=" + userId + ", accNo=" + accNo + ", baseAccNo=" + baseAccNo + ", livingAccNo="
				+ livingAccNo + ", extraAccNo=" + extraAccNo + ", baseBudget=" + baseBudget + ", livingBudget="
				+ livingBudget + ", extraBudget=" + extraBudget + ", totalBudget=" + totalBudget + ", accName="
				+ accName + ", bankName=" + bankName + ", balance=" + balance + ", regDate=" + regDate + ", flag="
				+ flag + ", autodebitCode=" + autodebitCode + ", moneyToLiving=" + moneyToLiving + ", moneyToExtra="
				+ moneyToExtra + ", dateToLiving=" + dateToLiving + ", dateToExtra=" + dateToExtra + ", baseMoney="
				+ baseMoney + ", livingCost=" + livingCost + ", extraMoney=" + extraMoney + "]";
	}

}
