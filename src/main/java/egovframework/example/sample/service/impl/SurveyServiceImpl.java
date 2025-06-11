package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.impl.SurveyMapper;
import egovframework.example.sample.service.SurveyService;
import egovframework.example.sample.service.SurveyVO;



@Service("surveyService")
public class SurveyServiceImpl implements SurveyService {

    @Resource(name = "surveyMapper")
    private SurveyMapper surveyMapper;

    @Override
    public void insertSurvey(SurveyVO survey) {
        surveyMapper.insertSurvey(survey);
    }

    @Override
    public List<SurveyVO> selectSurveyList() {
        return surveyMapper.selectSurveyList();
    }
    
//    @Override
//    public void updateSurveyOrder(List<Integer> surveyIds) {
//        for (int i = 0; i < surveyIds.size(); i++) {
//            int surveyId = surveyIds.get(i);
//            int sortOrder = i + 1;
//            surveyMapper.updateSortOrder(surveyId, sortOrder);
//        }
//    }
//    
//    @Override
//    public void updateSurveyOrder(List<Integer> surveyIds) {
//        for(int i = 0; i < surveyIds.size(); i++) {
//            surveyDAO.updateOrderNo(surveyIds.get(i), i);
//        }
//    }
//    @Override
//    public void updateSurveyOrder(int surveyId, int orderNo) {
//        surveyMapper.updateSurveyOrder(surveyId, orderNo);
//    }
    @Override
    public void updateSurveyOrder(SurveyVO survey) {
        surveyMapper.updateSurveyOrder(survey.getSurveyId(), survey.getOrderNo());
    }
    
    @Override
    public void deleteSurvey(int surveyId) throws Exception {
        surveyMapper.deleteSurvey(surveyId);
    }
}