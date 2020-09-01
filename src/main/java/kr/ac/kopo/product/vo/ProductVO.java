package kr.ac.kopo.product.vo;

public class ProductVO {

	private String accNo;
	private String transCode;
	private String transDate;

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getTransCode() {
		return transCode;
	}

	public void setTransCode(String transCode) {
		this.transCode = transCode;
	}

	public String getTransDate() {
		return transDate;
	}

	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}

	@Override
	public String toString() {
		return "ProductVO [accNo=" + accNo + ", transCode=" + transCode + ", transDate=" + transDate + "]";
	}

}
