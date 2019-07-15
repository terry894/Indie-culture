package org.hello.domain;

public class FileVO {
	
	 private int fno;
	    private int b_no;
	    private String filename;     //저장할 파일
	    private String fileOriName;  //실제 파일
	    private String fileurl;
		public int getFno() {
			return fno;
		}
		public void setFno(int fno) {
			this.fno = fno;
		}
		public int getB_no() {
			return b_no;
		}
		public void setB_no(int b_no) {
			this.b_no = b_no;
		}
		public String getFileName() {
			return filename;
		}
		public void setFileName(String fileName) {
			this.filename = fileName;
		}
		public String getFileOriName() {
			return fileOriName;
		}
		public void setFileOriName(String fileOriName) {
			this.fileOriName = fileOriName;
		}
		public String getFileUrl() {
			return fileurl;
		}
		public void setFileUrl(String fileUrl) {
			this.fileurl = fileUrl;
		}



}
