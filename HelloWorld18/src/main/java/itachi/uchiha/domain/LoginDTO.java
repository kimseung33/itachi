package itachi.uchiha.domain;

import java.io.Serializable;

public class LoginDTO implements Serializable{
//왜완되
	private static final long serialVersionUID = 1L;
	private String mb_Id;
	private String mb_Pw;
	public LoginDTO() {
		// TODO Auto-generated constructor stub
	}
	public LoginDTO(String mb_Id, String mb_Pw) {
		super();
		this.mb_Id = mb_Id;
		this.mb_Pw = mb_Pw;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
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
		LoginDTO other = (LoginDTO) obj;
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
		return "LoginDTO [mb_Id=" + mb_Id + ", mb_Pw=" + mb_Pw + "]";
	}
	
}
