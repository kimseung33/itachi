package kr.co.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.PageMaker;
import kr.co.domain.SearchCriteria;
import kr.co.service.BoardService;
import kr.co.utils.MediaUtils;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private BoardService service;
	
	
	@ResponseBody
	@RequestMapping(value="/deletefile",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName,int bno){
		
		service.deleteAttach(fileName,bno);
		
		ResponseEntity<String> entity=null;
		
		fileName.replace('/',File.separatorChar);
		
		String formatType=fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType=MediaUtils.getMediaType(formatType);
		
		if(mType!=null) {
			String prefix=fileName.substring(0,12);
			String subfix=fileName.substring(14);
			File f1 = new File(uploadPath+prefix+subfix);
			f1.delete();
			
			
		}
		File f2 = new File(uploadPath+fileName);
		f2.delete();
		
		entity = new ResponseEntity<String>("성공~",HttpStatus.OK);
		
		return entity;
	}
	
	

	@ResponseBody
	@RequestMapping(value="/getAttach/{bno}",method=RequestMethod.GET)
	public List<String> getAttach(@PathVariable("bno") Integer bno){
		return service.getAttach(bno);
	}
	

	@RequestMapping(value = "/insertui", method = RequestMethod.GET)
	public String insertui() {
		return "board/insert";

	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(BoardVO vo) {
		service.insert(vo);
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/read")
	public void read(int bno, Criteria cri, Model model) {
		BoardVO vo = service.read(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("cri", cri);

	}

	@RequestMapping("/updateui")
	public String updateui(int bno, Model model, @ModelAttribute("cri") Criteria cri) {

		BoardVO vo = service.updateUI(bno);
		model.addAttribute("vo", vo);
		return "board/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO vo, Model model, Criteria cri) {
		service.update(vo);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		return "redirect:/board/list";
	}

	@RequestMapping("/delete")
	public String delete(int bno, Model model, Criteria cri) {
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		service.delete(bno);
		return "redirect:/board/list";
	}

	@RequestMapping("/listpage")
	public String listPage(Criteria cri, Model model) {

		List<BoardVO> list = service.listPage(cri);
		model.addAttribute("list", list);
		return "board/list";

	}

	@RequestMapping("/list")
	public String list(Criteria cri, Model model) {

		List<BoardVO> list = service.listPage(cri);
		int amount = service.getAmount();

		PageMaker pm = new PageMaker(amount, cri);

		model.addAttribute("pm", pm);
		model.addAttribute("list", list);
		return "board/list";
	}

	@RequestMapping("/search") // 검색 기능
	public String search(SearchCriteria cri, Model model) {

		// 페이징처리 시작
		List<BoardVO> list = service.search(cri);
		model.addAttribute("list", list);

		int amount = service.getSearchtAmount(cri);

		PageMaker pm = new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("pm", pm);
		// 페이징처리 끝

		return "board/search";
	}

	@RequestMapping(value = "/sread")
	public void sread(int bno, SearchCriteria cri, Model model) {
		BoardVO vo = service.read(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("cri", cri);

	}

	@RequestMapping("/supdateui")
	public String supdateui(int bno, Model model, @ModelAttribute("cri") SearchCriteria cri) {

		BoardVO vo = service.updateUI(bno);
		model.addAttribute("vo", vo);
		return "board/supdate";
	}

	@RequestMapping(value = "/supdate", method = RequestMethod.POST)
	public String supdate(BoardVO vo, SearchCriteria cri, RedirectAttributes rttr) {
		service.update(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPage", cri.getPerPage());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("searchType", cri.getSearchType());
		return "redirect:/board/search";
	}

	@RequestMapping("/sdelete")
	public String sdelete(int bno, Model model, SearchCriteria cri, RedirectAttributes rttr) {
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPage", cri.getPerPage());
		service.delete(bno);
		return "redirect:/board/search";
	}

}
