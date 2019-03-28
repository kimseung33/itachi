package itachi.uchiha.domain;

import java.io.Serializable;

public class LoginDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String mb_id;
	private String mb_pw;
	public LoginDTO() {
		// TODO Auto-generated constructor stub
	}
	public LoginDTO(String mb_id, String mb_pw) {
		super();
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
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
		LoginDTO other = (LoginDTO) obj;
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
		return "LoginDTO [mb_id=" + mb_id + ", mb_pw=" + mb_pw + "]";
	}
	
	
}
