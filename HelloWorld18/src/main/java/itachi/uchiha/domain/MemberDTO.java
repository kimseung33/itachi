package itachi.uchiha.domain;

import java.io.Serializable;

public class MemberDTO implements Serializable {	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String mb_Id;
	private String mb_Pw;
	private String mb_Name;
	private String mb_Birth;
	private int mb_Zip;
	private String mb_Addr1;
	private String mb_Addr2;
	private String mb_Addr3;
	private int mb_Hp;
	private String mb_Email;
	private String mb_Date;
	private String mb_Bank;
	private String mb_Account;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}


	public MemberDTO(String mb_Id, String mb_Pw, String mb_Name, String mb_Birth, int mb_Zip, String mb_Addr1,
			String mb_Addr2, String mb_Addr3, int mb_Hp, String mb_Email, String mb_Date, String mb_Bank,
			String mb_Account) {
		super();
		this.mb_Id = mb_Id;
		this.mb_Pw = mb_Pw;
		this.mb_Name = mb_Name;
		this.mb_Birth = mb_Birth;
		this.mb_Zip = mb_Zip;
		this.mb_Addr1 = mb_Addr1;
		this.mb_Addr2 = mb_Addr2;
		this.mb_Addr3 = mb_Addr3;
		this.mb_Hp = mb_Hp;
		this.mb_Email = mb_Email;
		this.mb_Date = mb_Date;
		this.mb_Bank = mb_Bank;
		this.mb_Account = mb_Account;
	}











	public String getMb_Id() {
		return mb_Id;
	}




	public void setMb_Id(String mb_Id) {
		this.mb_Id = mb_Id;
	}




	public String getMb_Pw() {
		return mb_Pw;
	}




	public void setMb_Pw(String mb_Pw) {
		this.mb_Pw = mb_Pw;
	}

	


	public String getMb_Name() {
		return mb_Name;
	}


	public void setMb_Name(String mb_Name) {
		this.mb_Name = mb_Name;
	}


	public String getMb_Birth() {
		return mb_Birth;
	}




	public void setMb_Birth(String mb_Birth) {
		this.mb_Birth = mb_Birth;
	}




	public int getMb_Zip() {
		return mb_Zip;
	}




	public void setMb_Zip(int mb_Zip) {
		this.mb_Zip = mb_Zip;
	}




	public String getMb_Addr1() {
		return mb_Addr1;
	}




	public void setMb_Addr1(String mb_Addr1) {
		this.mb_Addr1 = mb_Addr1;
	}




	public String getMb_Addr2() {
		return mb_Addr2;
	}




	public void setMb_Addr2(String mb_Addr2) {
		this.mb_Addr2 = mb_Addr2;
	}




	public String getMb_Addr3() {
		return mb_Addr3;
	}




	public void setMb_Addr3(String mb_Addr3) {
		this.mb_Addr3 = mb_Addr3;
	}




	public int getMb_Hp() {
		return mb_Hp;
	}




	public void setMb_Hp(int mb_Hp) {
		this.mb_Hp = mb_Hp;
	}




	public String getMb_Email() {
		return mb_Email;
	}




	public void setMb_Email(String mb_Email) {
		this.mb_Email = mb_Email;
	}




	public String getMb_Date() {
		return mb_Date;
	}




	public void setMb_Date(String mb_Date) {
		this.mb_Date = mb_Date;
	}




	public String getMb_Bank() {
		return mb_Bank;
	}




	public void setMb_Bank(String mb_Bank) {
		this.mb_Bank = mb_Bank;
	}




	public String getMb_Account() {
		return mb_Account;
	}




	public void setMb_Account(String mb_Account) {
		this.mb_Account = mb_Account;
	}








	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mb_Id == null) ? 0 : mb_Id.hashCode());
		result = prime * result + ((mb_Pw == null) ? 0 : mb_Pw.hashCode());
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
		MemberDTO other = (MemberDTO) obj;
		if (mb_Id == null) {
			if (other.mb_Id != null)
				return false;
		} else if (!mb_Id.equals(other.mb_Id))
			return false;
		if (mb_Pw == null) {
			if (other.mb_Pw != null)
				return false;
		} else if (!mb_Pw.equals(other.mb_Pw))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "MemberDTO [mb_Id=" + mb_Id + ", mb_Name=" + mb_Name + ", mb_Birth=" + mb_Birth + ", mb_Zip=" + mb_Zip
				+ ", mb_Addr1=" + mb_Addr1 + ", mb_Addr2=" + mb_Addr2 + ", mb_Addr3=" + mb_Addr3 + ", mb_Hp=" + mb_Hp
				+ ", mb_Email=" + mb_Email + ", mb_Date=" + mb_Date + ", mb_Bank=" + mb_Bank + ", mb_Account="
				+ mb_Account + "]";
	}




	

	
	

	

	
}
