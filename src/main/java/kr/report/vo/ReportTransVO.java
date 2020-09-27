package kr.ac.kopo.report.vo;

public class ReportTransVO {
	private String accNo;
	private String tDate;
	private String summary;
	private String memo;
	private int withdraw;

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getTdate() {
		return tDate;
	}

	public void setTdate(String tDate) {
		this.tDate = tDate;
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

	public int getWithdraw() {
		return withdraw;
	}

	public void setWithdraw(int withdraw) {
		this.withdraw = withdraw;
	}

	@Override
	public String toString() {
		return "ReportTransVO [accNo=" + accNo + ", tDate=" + tDate + ", summary=" + summary + ", memo=" + memo
				+ ", withdraw=" + withdraw + "]";
	}

}
