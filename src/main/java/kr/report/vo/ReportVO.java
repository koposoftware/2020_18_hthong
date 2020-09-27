package kr.ac.kopo.report.vo;

public class ReportVO {
	// tts_path table
	private String id;
	private String name;
	private String mobile;
	private String accNo;
	private String filename;
	private String path;
	private String saveDate;

	// 이메일 리포트 관련
	private String email;
	private String receiver;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getSaveDate() {
		return saveDate;
	}

	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Override
	public String toString() {
		return "ReportVO [id=" + id + ", name=" + name + ", mobile=" + mobile + ", accNo=" + accNo + ", filename="
				+ filename + ", path=" + path + ", saveDate=" + saveDate + ", email=" + email + ", receiver=" + receiver
				+ "]";
	}

}
