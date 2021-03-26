package kr.swcore.sderp.organiz;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.CodeController;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.organiz.Service.OrganizService;

@Controller
@RequestMapping("/organiz/*")

public class OrganizController {
	
	private static final Logger logger = LoggerFactory.getLogger(CodeController.class);
	
	@Inject
	CodeService codeService;
	
	@Inject
	OrganizService organizService;

	/*
	// SalesController �� settarget �޼ҵ�� �̿�
	@RequestMapping("listDept.do")
	public ModelAndView list(ModelAndView mav, int compNo) {
		mav.setViewName("organiz/view");
		mav.addObject("list", organizService.listDept(compNo));
		return mav;
	}
	*/
}
