package product;

public class ProductVo {
	int serial;
	String gubun = "";
	String nal = "";
	String pCode = "";
	String pName = "";
	int ea;
	int price;
	int amt;
	String mid = "";
	//데이터 베이스의 테이블의 컬럼들을 불러오기위해 변수를 선언하였다. 빈문자열로 설정한 것은 null 값을 표시하지 않게 하기 위함.
	
	
	//타 클래스에서 값을 얻어오고 변경하기 위한 getter, setter 메서드를 선언하였다.
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getGubun() {
		return (gubun == null)? "" : gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getNal() {
		return nal;
	}
	public void setNal(String nal) {
		this.nal = nal;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmt() {
		return amt;
	}
	public void setAmt(int amt) {
		this.amt = amt;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
}
