package meet.bo;

public class Coupon {

	long id;
	String code;
	long value;
	long range;
	long max_value;
	
	
	

	public long getMax_value() {
		return max_value;
	}
	public void setMax_value(long max_value) {
		this.max_value = max_value;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public long getValue() {
		return value;
	}
	public void setValue(long value) {
		this.value = value;
	}
	public long getRange() {
		return range;
	}
	public void setRange(long range) {
		this.range = range;
	}
	
}
