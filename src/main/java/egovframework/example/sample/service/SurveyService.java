package egovframework.example.sample.service;

import java.util.List;

public interface SurveyService {
	void insertSurvey(SurveyVO survey);
	List<SurveyVO> selectSurveyList();
//	void updateSurveyOrder(int surveyId, int orderNo);
	void updateSurveyOrder(SurveyVO survey);


}
