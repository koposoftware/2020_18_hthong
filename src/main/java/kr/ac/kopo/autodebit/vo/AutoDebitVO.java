package kr.ac.kopo.autodebit.vo;

public class AutoDebitVO {
	private String AccNo; // 자동이체 걸린 계좌번호
	private String category; // 자동이체 구분
	private String setMoney; // 자동이체 금액
	private String startDate; // 자동이체 시작일
	private String cycle; // 자동이체 주기(1일, 7일, 30일 먼저 구현)
	private String status; // 자동이체 상태(정상, 해지)
	private String closeDate; // 자동이체 해지일
	private String oppAccNo; // 자동이체 상대방 계좌번호
	private String autodebitCode; // 자동이체 고유번호
	private String bankName; // 상대방 은행명
	private String lastRunDate; // 마지막 자동이체일

	private String setDate; // 설정일

	public String getAccNo() {
		return AccNo;
	}

	public void setAccNo(String accNo) {
		AccNo = accNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSetMoney() {
		return setMoney;
	}

	public void setSetMoney(String setMoney) {
		this.setMoney = setMoney;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getCycle() {
		return cycle;
	}

	public void setCycle(String cycle) {
		this.cycle = cycle;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}

	public String getOppAccNo() {
		return oppAccNo;
	}

	public void setOppAccNo(String oppAccNo) {
		this.oppAccNo = oppAccNo;
	}

	public String getAutodebitCode() {
		return autodebitCode;
	}

	public void setAutodebitCode(String autodebitCode) {
		this.autodebitCode = autodebitCode;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getLastRunDate() {
		return lastRunDate;
	}

	public void setLastRunDate(String lastRunDate) {
		this.lastRunDate = lastRunDate;
	}

	public String getSetDate() {
		return setDate;
	}

	public void setSetDate(String setDate) {
		this.setDate = setDate;
	}

	@Override
	public String toString() {
		return "AutoDebitVO [AccNo=" + AccNo + ", category=" + category + ", setMoney=" + setMoney + ", startDate="
				+ startDate + ", cycle=" + cycle + ", status=" + status + ", closeDate=" + closeDate + ", oppAccNo="
				+ oppAccNo + ", autodebitCode=" + autodebitCode + ", bankName=" + bankName + ", lastRunDate="
				+ lastRunDate + ", setDate=" + setDate + "]";
	}

}