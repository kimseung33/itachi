package kr.co.domain;

import java.io.Serializable;

public class ReplyVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int rno;
	private int bno;
	private String replyText;
	private String replyer;
	private String regDate;
	private String updateDate;

	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyVO(int rno, int bno, String replyText, String replyer, String regDate, String updateDate) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.replyText = replyText;
		this.replyer = replyer;
		this.regDate = regDate;
		this.updateDate = updateDate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getReplyText() {
		return replyText;
	}

	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replyText=" + replyText + ", replyer=" + replyer
				+ ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bno;
		result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
		result = prime * result + ((replyText == null) ? 0 : replyText.hashCode());
		result = prime * result + ((replyer == null) ? 0 : replyer.hashCode());
		result = prime * result + rno;
		result = prime * result + ((updateDate == null) ? 0 : updateDate.hashCode());
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
		ReplyVO other = (ReplyVO) obj;
		if (bno != other.bno)
			return false;
		if (regDate == null) {
			if (other.regDate != null)
				return false;
		} else if (!regDate.equals(other.regDate))
			return false;
		if (replyText == null) {
			if (other.replyText != null)
				return false;
		} else if (!replyText.equals(other.replyText))
			return false;
		if (replyer == null) {
			if (other.replyer != null)
				return false;
		} else if (!replyer.equals(other.replyer))
			return false;
		if (rno != other.rno)
			return false;
		if (updateDate == null) {
			if (other.updateDate != null)
				return false;
		} else if (!updateDate.equals(other.updateDate))
			return false;
		return true;
	}

}
