package board;

import java.sql.Date;

public class PBoardBean {

	
	private int num;
	private String pass;
	private String name;
	private String subject;
	private String content;
	private Date date;
	private int readcount;
	private String file;
	private int type;
	private int re_lev;
	private int re_seq;
	private int re_ref;

	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
	public PBoardBean() {
		super();
	}
	public PBoardBean(int num, String pass, String name, String subject, String content, Date date, int readcount,
			String file, int type) {
		super();
		this.num = num;
		this.pass = pass;
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.date = date;
		this.readcount = readcount;
		this.file = file;
		this.type = type;
	}
	public PBoardBean( String pass, String name, String subject, String content, Date date, int readcount,
			String file, int type) {
		super();
		this.pass = pass;
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.readcount = readcount;
		this.file = file;
		this.type = type;
		
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	
	
	
	
	
	
	
	
	
}
