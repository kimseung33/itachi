package itachi.uchiha.domain;

import java.io.Serializable;

public class SellDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sellNumber;	//입찰하는 경매 물품number(productNumber)
	private String sellId;		//입찰자 id
	private String sellDate;	//입찰날
	private int nowMoney;		//현재금액
	
	public SellDTO() {
		// TODO Auto-generated constructor stub
	}

	public SellDTO(String sellNumber, String sellId, String sellDate, int nowMoney) {
		super();
		this.sellNumber = sellNumber;
		this.sellId = sellId;
		this.sellDate = sellDate;
		this.nowMoney = nowMoney;
	}

	public String getSellNumber() {
		return sellNumber;
	}

	public void setSellNumber(String sellNumber) {
		this.sellNumber = sellNumber;
	}

	public String getSellId() {
		return sellId;
	}

	public void setSellId(String sellId) {
		this.sellId = sellId;
	}

	public String getSellDate() {
		return sellDate;
	}

	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}

	public int getNowMoney() {
		return nowMoney;
	}

	public void setNowMoney(int nowMoney) {
		this.nowMoney = nowMoney;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sellId == null) ? 0 : sellId.hashCode());
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
		SellDTO other = (SellDTO) obj;
		if (sellId == null) {
			if (other.sellId != null)
				return false;
		} else if (!sellId.equals(other.sellId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "SellDTO [sellNumber=" + sellNumber + ", sellId=" + sellId + ", sellDate=" + sellDate + ", nowMoney="
				+ nowMoney + "]";
	}
	
	
	

}
