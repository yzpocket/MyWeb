package memo.model;
import java.sql.Date;
//VO(Value Object), DTO(Data Transfer Object)라고 한다.
//Domain 객체라고 함
//domain 객체는 db table의 record 를 클래스로 옮겨 구성. 
//컬럼명을 멤버변수 선언. 가능하면 이름을 맞춰서 구성한다.
public class MemoVO {
	private int idx;
	private String name;
	private String msg;
	private java.sql.Date wdate;
	
	//기본생성자.
	//Spring 등 Framework에서 기본생성자가 필요함

	/** VO 기본 생성자 */
	public MemoVO() {
	}
	
	/** 생성자 오버로드 Source/Generate Constructor Using Fields 로 생성 가능. */
	public MemoVO(int idx, String name, String msg, Date wdate) {
		this.idx=idx;
		this.name=name;
		this.msg=msg;
		this.wdate=wdate;
	}

	/** Setter/Getter Source/Generate Getters/Setters 로 생성 가능. */
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public java.sql.Date getWdate() {
		return wdate;
	}

	public void setWdate(java.sql.Date wdate) {
		this.wdate = wdate;
	}
	
}
