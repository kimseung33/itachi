package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.Criteria;
import kr.co.domain.PageMaker;
import kr.co.domain.ReplyVO;
import kr.co.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private ReplyService service;
	
	@RequestMapping(value="checkid2/{inputID2}",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> checkId2(@PathVariable("inputID2")int inputID2){
		ResponseEntity<Map<String, Object>> entity=null;
		String msg="";
		Map<String, Object> map = new HashMap<String, Object>();
		if(inputID2==1) {
				msg="사용불가";	
		}else {
			msg="사용가능";
		}
		map.put("msg",msg);
		entity=new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		return entity;
	}

	
	
	@RequestMapping(value="checkid/{inputID}",method=RequestMethod.GET)
	public ResponseEntity<Boolean> checkId(@PathVariable("inputID")int inputID){
		ResponseEntity<Boolean> entity=null;
		if(inputID==1) {
			entity = new ResponseEntity<Boolean>(false,HttpStatus.OK);			
		}else {
			entity=new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}
		
		return entity;
	}

	@RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list(@PathVariable("bno")int bno,@PathVariable("page")int page) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			List<ReplyVO> list = service.list(bno,page);
			int amount=service.getAmount(bno);
			PageMaker pm=new PageMaker();
			Criteria cri = new Criteria();
			cri.setPage(page);
			pm.setCri(cri);//pm.setAmount와 순서가 바뀌면 안됨
			pm.setAmount(amount);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("list", list);
			map.put("pm", pm);
			
			
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody ReplyVO vo) {

		ResponseEntity<String> entity = null;

		try {
			service.insert(vo);
			entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{rno}", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("rno") int rno, @RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;

		try {
			vo.setRno(rno);
			service.update(vo);
			entity = new ResponseEntity<String>("good", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	@RequestMapping(value="/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rno") int rno) {
		ResponseEntity<String> entity = null;

		try {
			service.delete(rno);
			entity = new ResponseEntity<String>("good", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	

}
