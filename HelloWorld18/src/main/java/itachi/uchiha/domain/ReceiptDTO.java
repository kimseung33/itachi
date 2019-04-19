package itachi.uchiha.domain;

import java.io.Serializable;

public class ReceiptDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	private int nowMoney;	//입찰금액
	private String sellId;	//구매자아이디
	private String sellAddress;	//구매자주소
	private String title;	//물품제목
	private String productnumber;	//판매된 물품의 물품번호
	private String mb_Id;	//판매자 아이디
	public ReceiptDTO() {
		// TODO Auto-generated constructor stub
	}
	public ReceiptDTO(int nowMoney, String sellId, String sellAddress, String title, String productnumber,
			String mb_Id) {
		super();
		this.nowMoney = nowMoney;
		this.sellId = sellId;
		this.sellAddress = sellAddress;
		this.title = title;
		this.productnumber = productnumber;
		this.mb_Id = mb_Id;
	}
	public int getNowMoney() {
		return nowMoney;
	}
	public void setNowMoney(int nowMoney) {
		this.nowMoney = nowMoney;
	}
	public String getSellId() {
		return sellId;
	}
	public void setSellId(String sellId) {
		this.sellId = sellId;
	}
	public String getSellAddress() {
		return sellAddress;
	}
	public void setSellAddress(String sellAddress) {
		this.sellAddress = sellAddress;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getProductnumber() {
		return productnumber;
	}
	public void setProductnumber(String productnumber) {
		this.productnumber = productnumber;
	}
	public String getMb_Id() {
		return mb_Id;
	}
	public void setMb_Id(String mb_Id) {
		this.mb_Id = mb_Id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((productnumber == null) ? 0 : productnumber.hashCode());
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
		ReceiptDTO other = (ReceiptDTO) obj;
		if (productnumber == null) {
			if (other.productnumber != null)
				return false;
		} else if (!productnumber.equals(other.productnumber))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "ReceiptDTO [nowMoney=" + nowMoney + ", sellId=" + sellId + ", sellAddress=" + sellAddress + ", title="
				+ title + ", productnumber=" + productnumber + ", mb_Id=" + mb_Id + "]";
	}
	
}
