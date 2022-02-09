package kr.swcore.sderp.account;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.account.service.AccountService;
import kr.swcore.sderp.code.service.CodeService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/acc/*")
public class AccountController {

    @Inject
    AccountService accountService;

    @Inject
    CodeService codeService;

    @RequestMapping("vatlist.do")
    public ModelAndView vatList(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listvat(session));
        mav.setViewName("settle/vatlist");
        return mav;
    }

    @RequestMapping("baclist.do")
    public ModelAndView bacList(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listbac(session));
        mav.setViewName("settle/baclist");
        return mav;
    }

    @RequestMapping("regbac.do")
    public ModelAndView regbac(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listbac(session));
        mav.addObject("bnkcd", codeService.listCode003("BANKCD"));
        mav.addObject("baccd", codeService.listCode003("BACTYPE"));
        mav.setViewName("settle/regbaclist");
        return mav;
    }

    @RequestMapping("bacdetail.do")
    public ModelAndView bacDetail(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listbac(session));
        mav.setViewName("settle/bacdetail");
        return mav;
    }

    @RequestMapping("bacupdate.do")
    public ModelAndView bacUpload(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listvat(session));
        mav.setViewName("settle/bacupload");
        return mav;
    }
    
    @ResponseBody
    @RequestMapping("selectVatCust/{vatNo}")
    public AccountDTO selectVatCust(@PathVariable("vatNo") String vatNo) {
    	AccountDTO dto = accountService.selectVatCust(vatNo);
    	
		return dto;
    }


    @ResponseBody
    @RequestMapping("vatcheck.do")
    public AccountDTO vchk(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
        AccountDTO vserial = accountService.checkVat(dto);
        return vserial;
    }

    @RequestMapping("vatupload.do")
    public ModelAndView vatUpload(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listvat(session));
        mav.setViewName("settle/vatupload");
        return mav;
    }

    @RequestMapping("vatdetail/{vatId}")
    public ModelAndView vatDetail(@PathVariable("vatId") int vatId, ModelAndView mav) {
        mav.addObject("vatdetail", accountService.detailvat(vatId));
        mav.setViewName("settle/vatdetail");
        return mav;
    }

    @RequestMapping("insertvat.do")
    public ResponseEntity<Object> insertvat(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatIns = accountService.insertVat(dto);
        if(vatIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("insertbac.do")
    public ResponseEntity<Object> insertbac(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatIns = accountService.insertBac(dto);
        if(vatIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("insertbacledger.do")
    public ResponseEntity<Object> insertbacledger(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatIns = accountService.insertBacledger(dto);
        if(vatIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("vatStatuschg.do")
    public ResponseEntity<Object> chgvat(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int chgVat = accountService.updvatStat(dto);
        if(chgVat > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("/totalamount/{vatSerial}")
    public String totalamount(@PathVariable("vatSerial") String vatSerial, AccountDTO dto, Model model) {
    	dto.setVatSerial(vatSerial);
    	List<AccountDTO> connect_list = accountService.connect_list(dto);
    	model.addAttribute("connect_list", connect_list);
    	return "settle/totalamount";
    }
    
}
