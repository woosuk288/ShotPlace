package net.my.board;

public class AttachFile {
	private int attachFileNo;
	private String filename;    
	private String filetype;    
	private long filesize;    
	private int articleNo;
	
	public int getAttachFileNo() {
		return attachFileNo;
	}
	public void setAttachFileNo(int attachFileNo) {
		this.attachFileNo = attachFileNo;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	
}
