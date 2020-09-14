package kr.ac.kopo.product.vo;

// 대시보드 - 개인용, 비교분석용 vo
public class AnalysisVO {
	private String accNo; // 원픽 계좌번호
	private String moneyToLiving; // 생활비(자동이동)
	private String moneyToExtra; // 예비금(자동이동)
	private String dailyBudget; // 권장 일 평균 생활비
	private String numOfDay; // 당월의 총 일수
	private String numOfDayLeft; // 당월의 남은 일수
	private String numOfDayLast; // 당월의 지난 일수
	private String remainingBudget; // 당월의 남은 생활비 예산(생활비 예산 - 지출액)
	private String monthSpending;
	private String recDailyBudget;
	private String estimSum;
	private String spendingRatio;
	
	private String age;
	private String incomeAge;
	private String fixedCostAge;
	private String investmentAge;
	private String livingCostAge;
	private String extraMoneyAge;
	
	private String incomeSeg;
	private String fixedCostSeg;
	private String investmentSeg;
	private String livingCostSeg;
	private String extraMoneySeg;
	
	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
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

	public String getDailyBudget() {
		return dailyBudget;
	}

	public void setDailyBudget(String dailyBudget) {
		this.dailyBudget = dailyBudget;
	}

	public String getNumOfDay() {
		return numOfDay;
	}

	public void setNumOfDay(String numOfDay) {
		this.numOfDay = numOfDay;
	}

	public String getNumOfDayLeft() {
		return numOfDayLeft;
	}

	public void setNumOfDayLeft(String numOfDayLeft) {
		this.numOfDayLeft = numOfDayLeft;
	}

	public String getNumOfDayLast() {
		return numOfDayLast;
	}

	public void setNumOfDayLast(String numOfDayLast) {
		this.numOfDayLast = numOfDayLast;
	}

	public String getRemainingBudget() {
		return remainingBudget;
	}

	public void setRemainingBudget(String remainingBudget) {
		this.remainingBudget = remainingBudget;
	}

	public String getMonthSpending() {
		return monthSpending;
	}

	public void setMonthSpending(String monthSpending) {
		this.monthSpending = monthSpending;
	}

	public String getRecDailyBudget() {
		return recDailyBudget;
	}

	public void setRecDailyBudget(String recDailyBudget) {
		this.recDailyBudget = recDailyBudget;
	}

	public String getEstimSum() {
		return estimSum;
	}

	public void setEstimSum(String estimSum) {
		this.estimSum = estimSum;
	}

	public String getSpendingRatio() {
		return spendingRatio;
	}

	public void setSpendingRatio(String spendingRatio) {
		this.spendingRatio = spendingRatio;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getIncomeAge() {
		return incomeAge;
	}

	public void setIncomeAge(String incomeAge) {
		this.incomeAge = incomeAge;
	}

	public String getFixedCostAge() {
		return fixedCostAge;
	}

	public void setFixedCostAge(String fixedCostAge) {
		this.fixedCostAge = fixedCostAge;
	}

	public String getInvestmentAge() {
		return investmentAge;
	}

	public void setInvestmentAge(String investmentAge) {
		this.investmentAge = investmentAge;
	}

	public String getLivingCostAge() {
		return livingCostAge;
	}

	public void setLivingCostAge(String livingCostAge) {
		this.livingCostAge = livingCostAge;
	}

	public String getExtraMoneyAge() {
		return extraMoneyAge;
	}

	public void setExtraMoneyAge(String extraMoneyAge) {
		this.extraMoneyAge = extraMoneyAge;
	}

	public String getIncomeSeg() {
		return incomeSeg;
	}

	public void setIncomeSeg(String incomeSeg) {
		this.incomeSeg = incomeSeg;
	}

	public String getFixedCostSeg() {
		return fixedCostSeg;
	}

	public void setFixedCostSeg(String fixedCostSeg) {
		this.fixedCostSeg = fixedCostSeg;
	}

	public String getInvestmentSeg() {
		return investmentSeg;
	}

	public void setInvestmentSeg(String investmentSeg) {
		this.investmentSeg = investmentSeg;
	}

	public String getLivingCostSeg() {
		return livingCostSeg;
	}

	public void setLivingCostSeg(String livingCostSeg) {
		this.livingCostSeg = livingCostSeg;
	}

	public String getExtraMoneySeg() {
		return extraMoneySeg;
	}

	public void setExtraMoneySeg(String extraMoneySeg) {
		this.extraMoneySeg = extraMoneySeg;
	}

	@Override
	public String toString() {
		return "AnalysisVO [age=" + age + ", incomeAge=" + incomeAge + ", fixedCostAge=" + fixedCostAge
				+ ", investmentAge=" + investmentAge + ", livingCostAge=" + livingCostAge + ", extraMoneyAge="
				+ extraMoneyAge + ", incomeSeg=" + incomeSeg + ", fixedCostSeg=" + fixedCostSeg + ", investmentSeg="
				+ investmentSeg + ", livingCostSeg=" + livingCostSeg + ", extraMoneySeg=" + extraMoneySeg + "]";
	}

	/*
	 * @Override public String toString() { return "AnalysisVO [accNo=" + accNo +
	 * ", moneyToLiving=" + moneyToLiving + ", moneyToExtra=" + moneyToExtra +
	 * ", dailyBudget=" + dailyBudget + ", numOfDay=" + numOfDay + ", numOfDayLeft="
	 * + numOfDayLeft + ", numOfDayLast=" + numOfDayLast + ", remainingBudget=" +
	 * remainingBudget + ", monthSpending=" + monthSpending + ", recDailyBudget=" +
	 * recDailyBudget + ", estimSum=" + estimSum + ", spendingRatio=" +
	 * spendingRatio + "]"; }
	 */
	
	

}
