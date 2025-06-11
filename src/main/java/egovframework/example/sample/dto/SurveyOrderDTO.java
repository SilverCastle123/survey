package egovframework.example.sample.dto;



public class SurveyOrderDTO {

    private int surveyId;
    private int orderNo;

    // 기본 생성자
    public SurveyOrderDTO() {}

    // 생성자
    public SurveyOrderDTO(int surveyId, int orderNo) {
        this.surveyId = surveyId;
        this.orderNo = orderNo;
    }

    // Getter/Setter
    public int getSurveyId() {
        return surveyId;
    }

    public void setSurveyId(int surveyId) {
        this.surveyId = surveyId;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    // toString
    @Override
    public String toString() {
        return "SurveyOrderDTO{" +
                "surveyId=" + surveyId +
                ", orderNo=" + orderNo +
                '}';
    }
}
