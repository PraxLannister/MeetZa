package meet.bo;

import java.sql.Blob;

public class User {
	
		// TODO Auto-generated method stub

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getMail_id() {
		return mail_id;
	}
	public void setMail_id(String mail_id) {
		this.mail_id = mail_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public Blob getFile_data() {
		return file_data;
	}
	public void setFile_data(Blob file_data) {
		this.file_data = file_data;
	}
	public String getOrder_status() {
		return Order_status;
	}
	public void setOrder_status(String order_status) {
		Order_status = order_status;
	}
	public String getUser_Query() {
		return User_Query;
	}
	public void setUser_Query(String user_Query) {
		User_Query = user_Query;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	long id; 
	String user_name ;
	String mail_id;
	String user_password ;
	String user_address ;
	String user_phone; 
	String file_name;
	Blob file_data ;
	String  Order_status ;
	String User_Query ;
	String role ;
}
