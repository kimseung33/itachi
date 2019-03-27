package kr.co.domain;

import java.io.Serializable;

public class ReplyPageMaker implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private int replyAmount;
    private int totalPage;
    private int beginPageNum;
    private int stopPageNum;
	private ReplyCriteria rcri;
    
    public ReplyPageMaker() {
		// TODO Auto-generated constructor stub
	}

	public ReplyPageMaker(int replyAmount, int totalPage, int beginPageNum, int stopPageNum, ReplyCriteria rcri) {
		super();
		this.replyAmount = replyAmount;
		this.totalPage = totalPage;
		this.beginPageNum = beginPageNum;
		this.stopPageNum = stopPageNum;
		this.rcri = rcri;
	}

	public int getReplyAmount() {
		return replyAmount;
	}

	public void setReplyAmount(int replyAmount) {
		this.replyAmount = replyAmount;
		totalPage = (replyAmount-1)/rcri.getPerPage() + 1;
		beginPageNum = ((rcri.getPage()-1)/3)*3+1;
		stopPageNum = (((rcri.getPage()-1)/3)+1)*3;
		if(totalPage<stopPageNum) {
			stopPageNum = totalPage;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBeginPageNum() {
		return beginPageNum;
	}

	public void setBeginPageNum(int beginPageNum) {
		this.beginPageNum = beginPageNum;
	}

	public int getStopPageNum() {
		return stopPageNum;
	}

	public void setStopPageNum(int stopPageNum) {
		this.stopPageNum = stopPageNum;
	}

	public ReplyCriteria getRcri() {
		return rcri;
	}

	public void setRcri(ReplyCriteria rcri) {
		this.rcri = rcri;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public ReplyPageMaker(int replyAmount, ReplyCriteria rcri) {
		super();
		this.replyAmount = replyAmount;
		this.rcri = rcri;
		
		totalPage = (replyAmount-1)/rcri.getPerPage() + 1;
		beginPageNum = ((rcri.getPage()-1)/10)*10+1;
		stopPageNum = (((rcri.getPage()-1)/10)+1)*10;
		if(totalPage<stopPageNum) {
			stopPageNum = totalPage;
		}
	}
	
	
    
    
	
}
