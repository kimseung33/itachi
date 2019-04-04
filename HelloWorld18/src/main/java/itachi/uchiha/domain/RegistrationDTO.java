package itachi.uchiha.domain;

import java.io.Serializable;

public class RegistrationDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String productNumber; // 상품번호
	private String endDate; // 경매기간+등록시간(sysdate)
	private int deadline; // 경매기간
	private String writedate; // default로 sysdate가 넘어오기 위해서 추가
	private int startMoney; // 경매시작가
	private int directMoney; // 즉시구입가
	private String fileOriginame; // 파일명1
	private String fileOriginame2; // 파일명2
	private String title; // 제목
	private String setence; // 내용
	
	public RegistrationDTO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public RegistrationDTO(String productNumber, String endDate, int deadline, String writedate, int startMoney,
			int directMoney, String fileOriginame, String fileOriginame2, String title, String setence) {
		super();
		this.productNumber = productNumber;
		this.endDate = endDate;
		this.deadline = deadline;
		this.writedate = writedate;
		this.startMoney = startMoney;
		this.directMoney = directMoney;
		this.fileOriginame = fileOriginame;
		this.fileOriginame2 = fileOriginame2;
		this.title = title;
		this.setence = setence;
	}

	public String getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(String productNumber) {
		this.productNumber = productNumber;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getDeadline() {
		return deadline;
	}

	public void setDeadline(int deadline) {
		this.deadline = deadline;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getStartMoney() {
		return startMoney;
	}

	public void setStartMoney(int startMoney) {
		this.startMoney = startMoney;
	}

	public int getDirectMoney() {
		return directMoney;
	}

	public void setDirectMoney(int directMoney) {
		this.directMoney = directMoney;
	}

	public String getFileOriginame() {
		return fileOriginame;
	}

	public void setFileOriginame(String fileOriginame) {
		this.fileOriginame = fileOriginame;
	}

	public String getFileOriginame2() {
		return fileOriginame2;
	}

	public void setFileOriginame2(String fileOriginame2) {
		this.fileOriginame2 = fileOriginame2;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSetence() {
		return setence;
	}

	public void setSetence(String setence) {
		this.setence = setence;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((productNumber == null) ? 0 : productNumber.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RegistrationDTO other = (RegistrationDTO) obj;
		if (productNumber == null) {
			if (other.productNumber != null)
				return false;
		} else if (!productNumber.equals(other.productNumber))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RegistrationDTO [productNumber=" + productNumber + ", endDate=" + endDate + ", deadline=" + deadline
				+ ", writedate=" + writedate + ", startMoney=" + startMoney + ", directMoney=" + directMoney
				+ ", fileOriginame=" + fileOriginame + ", fileOriginame2=" + fileOriginame2 + ", title=" + title
				+ ", setence=" + setence + "]";
	}
	 

}
