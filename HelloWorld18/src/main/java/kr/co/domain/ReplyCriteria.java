package kr.co.domain;

public class ReplyCriteria {

	private int page;
	private int perPage;
	
	public ReplyCriteria() {

		page = 1;
		perPage = 3;
	}

	public ReplyCriteria(int page, int perPage) {
		super();
		this.page = page;
		this.perPage = perPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	
	public int getStartNum() {
		int startNum= (page-1)*perPage+1;
		return startNum;
		
	}
	
	
}
