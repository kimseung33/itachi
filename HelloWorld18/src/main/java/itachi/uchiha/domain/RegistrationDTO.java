package itachi.uchiha.domain;

import java.io.Serializable;
import java.util.Arrays;

public class RegistrationDTO implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	private String mb_Id;
	private String productNumber;	//상품번호
	private String endDate;		//경매기간+등록시간(sysdate)
	private int deadline;	//경매기간	not null
	private String writedate;	//default로 sysdate가 넘어오기 위해서 추가
	private int startMoney;		//경매시작가	not null
	private int directMoney;	//즉시구입가	not null
	private String title;	//제목	not null
	private String setence;	//내용	not null
	private String category; //항목
	private int nowMoney;
	private String[] files;

	public RegistrationDTO() {
		// TODO Auto-generated constructor stub
	}

	

	
	

	public RegistrationDTO(String mb_Id, String productNumber, String endDate, int deadline, String writedate,
			int startMoney, int directMoney, String title, String setence, String category, int nowMoney,
			String[] files) {
		super();
		this.mb_Id = mb_Id;
		this.productNumber = productNumber;
		this.endDate = endDate;
		this.deadline = deadline;
		this.writedate = writedate;
		this.startMoney = startMoney;
		this.directMoney = directMoney;
		this.title = title;
		this.setence = setence;
		this.category = category;
		this.nowMoney = nowMoney;
		this.files = files;
	}






	public String getMb_Id() {
		return mb_Id;
	}



	public void setMb_Id(String mb_Id) {
		this.mb_Id = mb_Id;
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

	

	public String[] getFiles() {
		return files;
	}






	public void setFiles(String[] files) {
		this.files = files;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getNowMoney() {
		return nowMoney;
	}

	public void setNowMoney(int nowMoney) {
		this.nowMoney = nowMoney;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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
		return "RegistrationDTO [mb_Id=" + mb_Id + ", productNumber=" + productNumber + ", endDate=" + endDate
				+ ", deadline=" + deadline + ", writedate=" + writedate + ", startMoney=" + startMoney
				+ ", directMoney=" + directMoney + ", title=" + title + ", setence=" + setence + ", category="
				+ category + ", nowMoney=" + nowMoney + ", files=" + Arrays.toString(files) + "]";
	}



	
	

}
