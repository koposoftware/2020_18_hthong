package kr.ac.kopo.product.vo;

public class ProductVO {
	private String accNo; // 원픽 계좌번호(account 테이블 계좌번호와 동일)
	private String baseAccNo; // 기본금 가상계좌번호
	private String livingAccNo; // 생활비 가상계좌번호
	private String extraAccNo; // 예비금 가상계좌번호
	private String investAccNo; // 투자예정금 가상계좌번호
	private String baseMoney;	// 기본금
	private String livingCost;	// 생활비
	private String extraMoney;	// 예비금
	private String investment;	// 투자 예정금

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

	public String getInvestAccNo() {
		return investAccNo;
	}

	public void setInvestAccNo(String investAccNo) {
		this.investAccNo = investAccNo;
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

	public String getInvestment() {
		return investment;
	}

	public void setInvestment(String investment) {
		this.investment = investment;
	}

	@Override
	public String toString() {
		return "ProductVO [accNo=" + accNo + ", baseAccNo=" + baseAccNo + ", livingAccNo=" + livingAccNo
				+ ", extraAccNo=" + extraAccNo + ", investAccNo=" + investAccNo + ", baseMoney=" + baseMoney
				+ ", livingCost=" + livingCost + ", extraMoney=" + extraMoney + ", investment=" + investment + "]";
	}

}
