package meet.bo;

import java.sql.Blob;

public class Shop {
	long shop_id; 
	String shop_name; 
	String shop_address; 
	String shop_file_name;
	Blob shop_file_data ; 
	String shop_details;
	
	public long getShop_id() {
		return shop_id;
	}
	public void setShop_id(long shop_id) {
		this.shop_id = shop_id;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getShop_address() {
		return shop_address;
	}
	public void setShop_address(String shop_address) {
		this.shop_address = shop_address;
	}
	public String getShop_file_name() {
		return shop_file_name;
	}
	public void setShop_file_name(String shop_file_name) {
		this.shop_file_name = shop_file_name;
	}
	
	public Blob getShop_file_data() {
		return shop_file_data;
	}
	public void setShop_file_data(Blob shop_file_data) {
		this.shop_file_data = shop_file_data;
	}
	
	public String getShop_details() {
		return shop_details;
	}
	public void setShop_details(String shop_details) {
		this.shop_details = shop_details;
	}

}
