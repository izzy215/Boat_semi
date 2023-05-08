package jhLee.filecomm.db;

public class FilecommBean {
	private int F_C_NUM;
	private String 	F_C_ID;
	private int F_CONTENT;
	private String F_COMMENT_NUM;
	private int F_COMMENT_RE_LEV;
	private int F_COMMENT_RE_SEQ;
	private int F_COMMENT_RE_REF; 
	private String F_COMMENT_DATE;
	
			public int getF_C_NUM() {
		return F_C_NUM;
	}
	public void setF_C_NUM(int f_C_NUM) {
		F_C_NUM = f_C_NUM;
	}
	public String getF_C_ID() {
		return F_C_ID;
	}
	public void setF_C_ID(String f_C_ID) {
		F_C_ID = f_C_ID;
	}
	public int getF_CONTENT() {
		return F_CONTENT;
	}
	public void setF_CONTENT(int f_CONTENT) {
		F_CONTENT = f_CONTENT;
	}
	public String getF_COMMENT_NUM() {
		return F_COMMENT_NUM;
	}
	public void setF_COMMENT_NUM(String f_COMMENT_NUM) {
		F_COMMENT_NUM = f_COMMENT_NUM;
	}
	public int getF_COMMENT_RE_LEV() {
		return F_COMMENT_RE_LEV;
	}
	public void setF_COMMENT_RE_LEV(int f_COMMENT_RE_LEV) {
		F_COMMENT_RE_LEV = f_COMMENT_RE_LEV;
	}
	public int getF_COMMENT_RE_SEQ() {
		return F_COMMENT_RE_SEQ;
	}
	public void setF_COMMENT_RE_SEQ(int f_COMMENT_RE_SEQ) {
		F_COMMENT_RE_SEQ = f_COMMENT_RE_SEQ;
	}
	public int getF_COMMENT_RE_REF() {
		return F_COMMENT_RE_REF;
	}
	public void setF_COMMENT_RE_REF(int f_COMMENT_RE_REF) {
		F_COMMENT_RE_REF = f_COMMENT_RE_REF;
	}
	public String getF_COMMENT_DATE() {
		return F_COMMENT_DATE;
	}
	public void setF_COMMENT_DATE(String f_COMMENT_DATE) {
		this.F_COMMENT_DATE = f_COMMENT_DATE.substring(0,10);
	}


}
