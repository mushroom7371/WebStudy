package board;

import java.util.List;

public class BoardVo {
	int serial;
	int pSerial;
	int hit;
	int attCnt;
	String subject = "";
	String doc = "";
	String mid = "";
	String pwd = "";
	String mdate = "";
	
	List<BoardAttVo> attList;	//첨부 파일 목록
	List<BoardAttVo> delList;	//삭제 파일 목록
	
	public List<BoardAttVo> getAttList() {
		return attList;
	}
	public void setAttList(List<BoardAttVo> attList) {
		this.attList = attList;
	}
	public List<BoardAttVo> getDelList() {
		return delList;
	}
	public void setDelList(List<BoardAttVo> delList) {
		this.delList = delList;
	}
	public int getAttCnt() {
		return attCnt;
	}
	public void setAttCnt(int attCnt) {
		this.attCnt = attCnt;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getpSerial() {
		return pSerial;
	}
	public void setpSerial(int pSerial) {
		this.pSerial = pSerial;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	
	
	
}
