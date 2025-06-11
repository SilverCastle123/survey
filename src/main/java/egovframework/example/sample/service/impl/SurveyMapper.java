package egovframework.example.sample.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import egovframework.example.sample.service.SurveyVO;

@Mapper
public interface SurveyMapper {
	void insertSurvey(SurveyVO survey);
	List<SurveyVO> selectSurveyList();
	 void updateSurveyOrder(@Param("surveyId") int surveyId, @Param("orderNo") int orderNo);

}
