package kr.ac.kopo.banking.vo;

public class TransactionVO {
	// 갈때
	private String id; // id
	private String accNo; // 계좌번호
	private String startDate; // 조회 시작일
	private String endDate; // 조회 종료일
	private String searchType; // 조회내용(입+출, 입, 출)
	private String searchCnt; // 조회건수
	private String searchSort; // order by 최근거래, 과거거래

	// 올때
	private String transDate; // 거래일시
	private String summary; // 구분
	private String memo; // 적요
	private String withdraw; // 출금액
	private String deposit; // 입금액
	private String balance; // 잔액
	private String oppAccNo; // 상대계좌
	private String withSum;
	private String depoSum;

	public TransactionVO() {
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

	public String getTransDate() {
		return transDate;
	}

	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchCnt() {
		return searchCnt;
	}

	public void setSearchCnt(String searchCnt) {
		this.searchCnt = searchCnt;
	}

	public String getSearchSort() {
		return searchSort;
	}

	public void setSearchSort(String searchSort) {
		this.searchSort = searchSort;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
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

	public String getWithdraw() {
		return withdraw;
	}

	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public String getOppAccNo() {
		return oppAccNo;
	}

	public void setOppAccNo(String oppAccNo) {
		this.oppAccNo = oppAccNo;
	}

	public String getWithSum() {
		return withSum;
	}

	public void setWithSum(String withSum) {
		this.withSum = withSum;
	}

	public String getDepoSum() {
		return depoSum;
	}

	public void setDepoSum(String depoSum) {
		this.depoSum = depoSum;
	}

	@Override
	public String toString() {
		return "TransactionVO [id=" + id + ", accNo=" + accNo + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", searchType=" + searchType + ", searchCnt=" + searchCnt + ", searchSort=" + searchSort
				+ ", transDate=" + transDate + ", summary=" + summary + ", memo=" + memo + ", withdraw=" + withdraw
				+ ", deposit=" + deposit + ", balance=" + balance + ", oppAccNo=" + oppAccNo + ", withSum=" + withSum
				+ ", depoSum=" + depoSum + "]";
	}

}
