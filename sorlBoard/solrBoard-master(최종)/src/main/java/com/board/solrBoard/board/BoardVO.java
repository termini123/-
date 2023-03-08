package com.board.solrBoard.board;

public class BoardVO {
    private String brdno; 
    private String brddate; 
    private String KR_IPCInformation;
    private String KR_CPCInformation;
    private String KR_OpenNumber;
    private String KR_OpenDate;
    private String KR_ApplicationNumber;
    private String KR_ApplicationDate;
    private String KR_ApplicantInformation;
    private String KR_Inventor;
    private String KR_Agent;
    private String invention_title;
    private String technical_field;
    private String background_art;
    private String claim_text;
    private String summary;

    public String getKR_IPCInformation() {
		return KR_IPCInformation;
	}
	public void setKR_IPCInformation(String kR_IPCInformation) {
		KR_IPCInformation = kR_IPCInformation;
	}
	public String getKR_CPCInformation() {
		return KR_CPCInformation;
	}
	public void setKR_CPCInformation(String kR_CPCInformation) {
		KR_CPCInformation = kR_CPCInformation;
	}
	public String getKR_OpenNumber() {
		return KR_OpenNumber;
	}
	public void setKR_OpenNumber(String kR_OpenNumber) {
		KR_OpenNumber = kR_OpenNumber;
	}
	public String getKR_OpenDate() {
		return KR_OpenDate;
	}
	public void setKR_OpenDate(String kR_OpenDate) {
		KR_OpenDate = kR_OpenDate;
	}
	public String getKR_ApplicationNumber() {
		return KR_ApplicationNumber;
	}
	public void setKR_ApplicationNumber(String kR_ApplicationNumber) {
		KR_ApplicationNumber = kR_ApplicationNumber;
	}
	public String getKR_ApplicationDate() {
		return KR_ApplicationDate;
	}
	public void setKR_ApplicationDate(String kR_ApplicationDate) {
		KR_ApplicationDate = kR_ApplicationDate;
	}
	public String getKR_ApplicantInformation() {
		return KR_ApplicantInformation;
	}
	public void setKR_ApplicantInformation(String kR_ApplicantInformation) {
		KR_ApplicantInformation = kR_ApplicantInformation;
	}
	public String getKR_Inventor() {
		return KR_Inventor;
	}
	public void setKR_Inventor(String kR_Inventor) {
		KR_Inventor = kR_Inventor;
	}
	public String getKR_Agent() {
		return KR_Agent;
	}
	public void setKR_Agent(String kR_Agent) {
		KR_Agent = kR_Agent;
	}
    public String getInvention_title() {
        return invention_title;
    }
    public void setInvention_title(String invention_title) {
        this.invention_title = invention_title;
    }
	public String getTechnical_field() {
		return technical_field;
	}
	public void setTechnical_field(String technical_field) {
		this.technical_field = technical_field;
	}
	public String getBackground_art() {
		return background_art;
	}
	public void setBackground_art(String background_art) {
		this.background_art = background_art;
	}
	public String getClaim_text() {
		return claim_text;
	}
	public void setClaim_text(String claim_text) {
		this.claim_text = claim_text;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
    public String getBrdno() {
        return brdno;
    }
    public void setBrdno(String brdno) {
        this.brdno = brdno;
    }
    public String getBrddate() {
        return brddate;
    }
    public void setBrddate(String brddate) {
        this.brddate = brddate;
    }
}
