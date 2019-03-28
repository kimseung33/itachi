package itachi.uchiha.domain;

import java.io.Serializable;

public class MemberDTO implements Serializable {
	//왜안됨ㄴ아ㅣㅇ;ㄴ머ㅡㅇㅈ마ㅣㅈ암;ㅣㅇㅈㅁ
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mb_id;
	private String mb_pw;
	private String mb_birth;
	private int mb_zip1;
	private int mb_zip2;
	private String mb_addr1;
	private String mb_addr2;
	private String mb_addr3;
	private int mb_hp;
	private String mb_email;
	private String mb_date;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String mb_id, String mb_pw, String mb_birth, int mb_zip1, int mb_zip2, String mb_addr1,
			String mb_addr2, String mb_addr3, int mb_hp, String mb_email, String mb_date) {
		super();
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_birth = mb_birth;
		this.mb_zip1 = mb_zip1;
		this.mb_zip2 = mb_zip2;
		this.mb_addr1 = mb_addr1;
		this.mb_addr2 = mb_addr2;
		this.mb_addr3 = mb_addr3;
		this.mb_hp = mb_hp;
		this.mb_email = mb_email;
		this.mb_date = mb_date;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getMb_birth() {
		return mb_birth;
	}

	public void setMb_birth(String mb_birth) {
		this.mb_birth = mb_birth;
	}

	public int getMb_zip1() {
		return mb_zip1;
	}

	public void setMb_zip1(int mb_zip1) {
		this.mb_zip1 = mb_zip1;
	}

	public int getMb_zip2() {
		return mb_zip2;
	}

	public void setMb_zip2(int mb_zip2) {
		this.mb_zip2 = mb_zip2;
	}

	public String getMb_addr1() {
		return mb_addr1;
	}

	public void setMb_addr1(String mb_addr1) {
		this.mb_addr1 = mb_addr1;
	}

	public String getMb_addr2() {
		return mb_addr2;
	}

	public void setMb_addr2(String mb_addr2) {
		this.mb_addr2 = mb_addr2;
	}

	public String getMb_addr3() {
		return mb_addr3;
	}

	public void setMb_addr3(String mb_addr3) {
		this.mb_addr3 = mb_addr3;
	}

	public int getMb_hp() {
		return mb_hp;
	}

	public void setMb_hp(int mb_hp) {
		this.mb_hp = mb_hp;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public String getMb_date() {
		return mb_date;
	}

	public void setMb_date(String mb_date) {
		this.mb_date = mb_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mb_id == null) ? 0 : mb_id.hashCode());
		result = prime * result + ((mb_pw == null) ? 0 : mb_pw.hashCode());
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
		if (mb_id == null) {
			if (other.mb_id != null)
				return false;
		} else if (!mb_id.equals(other.mb_id))
			return false;
		if (mb_pw == null) {
			if (other.mb_pw != null)
				return false;
		} else if (!mb_pw.equals(other.mb_pw))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemberDTO [mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", mb_birth=" + mb_birth + ", mb_zip1=" + mb_zip1
				+ ", mb_zip2=" + mb_zip2 + ", mb_addr1=" + mb_addr1 + ", mb_addr2=" + mb_addr2 + ", mb_addr3="
				+ mb_addr3 + ", mb_hp=" + mb_hp + ", mb_email=" + mb_email + ", mb_date=" + mb_date + "]";
	}
	
	
}
