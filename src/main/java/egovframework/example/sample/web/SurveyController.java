package egovframework.example.sample.web;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import egovframework.example.sample.service.SurveyService;
import egovframework.example.sample.service.SurveyVO;

@Controller
//@RequestMapping("/surveys")
public class SurveyController {
	
	@Resource(name = "surveyService")
	private SurveyService surveyService;
	
	@GetMapping("/list.do")
	public String list(Model model) {
		
		List<SurveyVO> surveys = surveyService.selectSurveyList();
		model.addAttribute("surveys", surveys);
		return "surveys/surveyList";
		
	}
	
	@GetMapping("/form.do")
	public String form() {
		return "surveys/surveyForm";
	}
	
	@PostMapping("/save.do")
	public String save(SurveyVO survey) {
		surveyService.insertSurvey(survey);
		return "redirect:/list.do";
	}
	
	@GetMapping("/test.do")
	public String test() {
		return "surveys/test";
	}
	

    @PostMapping("/saveOrder.do")
    @ResponseBody
    public String saveOrder(@RequestBody List<SurveyVO> orderList) {
        for (SurveyVO vo : orderList) {
            System.out.println("surveyId: " + vo.getSurveyId() + ", orderNo: " + vo.getOrderNo());
            surveyService.updateSurveyOrder(vo);
        }
        return "순서 저장 완료";
    }
	
    
    @PostMapping("/delete.do")
    public String deleteSurvey(@RequestBody Map<String, Object> payload) {
        try {
            Integer surveyId = (Integer) payload.get("surveyId");
            if (surveyId == null) {
                return "잘못된 요청입니다.";
            }

            surveyService.deleteSurvey(surveyId);
            return "삭제 성공";
        } catch (Exception e) {
            e.printStackTrace();
            return "삭제 실패";
        }
    }


}
