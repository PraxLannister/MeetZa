package meet.bo;

import java.sql.Blob;

public class Item {
	long item_id; 
	String item_name; 
	long item_price; 
	Shop shop;
	long item_quantity;
	String item_file_name;
	Blob item_file_data ;
	public long getItem_id() {
		return item_id;
	}
	public void setItem_id(long item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public long getItem_price() {
		return item_price;
	}
	public void setItem_price(long item_price) {
		this.item_price = item_price;
	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public long getItem_quantity() {
		return item_quantity;
	}
	public void setItem_quantity(long item_quantity) {
		this.item_quantity = item_quantity;
	}
	public String getItem_file_name() {
		return item_file_name;
	}
	public void setItem_file_name(String item_file_name) {
		this.item_file_name = item_file_name;
	}
	public Blob getItem_file_data() {
		return item_file_data;
	}
	public void setItem_file_data(Blob item_file_data) {
		this.item_file_data = item_file_data;
	}

	
}
