package egovframework.example.sample.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import egovframework.example.sample.dto.SurveyOrderDTO;
import egovframework.example.sample.service.SurveyService;
import egovframework.example.sample.service.SurveyVO;

@Controller
@RequestMapping("/surveys")
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
		return "redirect:/surveys/list.do";
	}
	
	@GetMapping("/test.do")
	public String test() {
		return "surveys/test";
	}
	
//	
//	@PostMapping("/saveOrder.do")
//	public ResponseEntity<String> saveOrder(@RequestBody List<SurveyOrderDTO> orderList) {
//		System.out.println("saveOrder확인");
//	    try {
//	        for (SurveyOrderDTO dto : orderList) {
//	        	System.out.println("Received DTO: surveyId=" + dto.getSurveyId() + ", orderNo=" + dto.getOrderNo());
//	            surveyService.updateSurveyOrder(dto.getSurveyId(), dto.getOrderNo());
//	        }
//	        return ResponseEntity.ok("success");
//	    } catch (Exception e) {
//	    	e.printStackTrace(); // 에러가 발생하면 스택트레이스 출력
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("fail");
//	    }
//	}
	
	
//	@PostMapping("/saveOrder.do")
//	@ResponseBody
//	public String saveOrder(@RequestBody List<SurveyOrderDTO> orderList) {
//	    for (SurveyOrderDTO item : orderList) {
//	        System.out.println("surveyId: " + item.getSurveyId() + ", orderNo: " + item.getOrderNo());
//	        // 여기에 DB 업데이트 로직 추가
//	    }
//	    return "순서 저장 완료";
//	}
//	
//	테스트
//	@PostMapping("/saveOrder.do")
//	@ResponseBody
//	public String saveOrder(HttpServletRequest request) {
//	    StringBuilder sb = new StringBuilder();
//	    try (BufferedReader reader = request.getReader()) {
//	        String line;
//	        while ((line = reader.readLine()) != null) {
//	            sb.append(line);
//	        }
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	        return "에러 발생: " + e.getMessage();
//	    }
//
//	    System.out.println("받은 Raw JSON: " + sb.toString());
//	    return "OK";
//	}


	
	
    @PostMapping("/saveOrder.do")
    @ResponseBody
    public String saveOrder(@RequestBody List<SurveyVO> orderList) {
        for (SurveyVO vo : orderList) {
            System.out.println("surveyId: " + vo.getSurveyId() + ", orderNo: " + vo.getOrderNo());
            surveyService.updateSurveyOrder(vo);
        }
        return "순서 저장 완료";
    }
	


}
