package egovframework.example.sample.service;

import java.util.Date;
import java.util.List;


public class SurveyVO {
	private int surveyId;
	private String title;
	private String description;
	private Date regDate;
    private int orderNo;  // 순서 정보 추가
	

	
	
	 public Integer getSurveyId() {
	        return surveyId;
	    }

	    public void setSurveyId(Integer surveyId) {
	        this.surveyId = surveyId;
	    }

	    public String getTitle() {
	        return title;
	    }

	    public void setTitle(String title) {
	        this.title = title;
	    }

	    public String getDescription() {
	        return description;
	    }

	    public void setDescription(String description) {
	        this.description = description;
	    }

	    public Date getRegDate() {
	        return regDate;
	    }

	    public void setRegDate(Date regDate) {
	        this.regDate = regDate;
	    }
	    
	    
	    public int getOrderNo() {
	        return orderNo;
	    }

	    public void setOrderNo(int orderNo) {
	        this.orderNo = orderNo;
	    }
	    
	    
	    @Override
	    public String toString() {
	        return "SurveyVO{" +
	                "surveyId=" + surveyId +
	                ", title='" + title + '\'' +
	                ", description='" + description + '\'' +
	                ", regDate=" + regDate +
	                ", orderNo=" + orderNo +
	                '}';
	    }

}
