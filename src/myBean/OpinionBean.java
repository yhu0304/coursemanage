package myBean;

import java.io.Serializable;

public class OpinionBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String txt;
	public String from;

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}
	
}
