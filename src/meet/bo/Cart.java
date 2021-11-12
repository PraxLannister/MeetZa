package meet.bo;

public class Cart {
	long cart_id;
	String mail_id;
	java.sql.Date dop;
	Item item;
	Shop shop;
	long item_quantity_no;
	public long getCart_id() {
		return cart_id;
	}
	public void setCart_id(long cart_id) {
		this.cart_id = cart_id;
	}
	public String getMail_id() {
		return mail_id;
	}
	public void setMail_id(String mail_id) {
		this.mail_id = mail_id;
	}
	public java.sql.Date getDop() {
		return dop;
	}
	public void setDop(java.sql.Date dop) {
		this.dop = dop;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public long getItem_quantity_no() {
		return item_quantity_no;
	}
	public void setItem_quantity_no(long item_quantity_no) {
		this.item_quantity_no = item_quantity_no;
	}
}
