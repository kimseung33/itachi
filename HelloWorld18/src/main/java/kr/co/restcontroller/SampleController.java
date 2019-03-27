package kr.co.restcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.BoardVO;

@RestController
@RequestMapping("/sample")
public class SampleController {

	@RequestMapping("/sendlistnot")
	public ResponseEntity<List<BoardVO>> sendeListNot() {
		List<BoardVO> list = new ArrayList<BoardVO>();

		for (int i = 0; i < 10; i++) {

			BoardVO vo = new BoardVO(i, "제목" + i, "내용" + i, "작성자" + i, null, null, i);
			list.add(vo);
		}

		return new ResponseEntity<List<BoardVO>>(list, HttpStatus.NOT_FOUND);

	}

	@RequestMapping("senderror")
	public ResponseEntity<Void> senderr() {
//제네릭은 참조자료형 객체만 지원  가능함 그래서 대문자 Void로 해야됨		

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@RequestMapping("sendmap")
	public Map<Integer, BoardVO> sendmap() {
		Map<Integer, BoardVO> map = new HashMap<Integer, BoardVO>();

		for (int i = 0; i < 10; i++) {

			BoardVO vo = new BoardVO(i, "제목" + i, "내용" + i, "작성자" + i, null, null, i);

			map.put(i, vo);
		}

		return map;
	}

	@RequestMapping("sendlist")
	public List<BoardVO> sendList() {
		List<BoardVO> list = new ArrayList<BoardVO>();

		for (int i = 0; i < 10; i++) {

			BoardVO vo = new BoardVO(i, "제목" + i, "내용" + i, "작성자" + i, null, null, i);
			list.add(vo);
		}

		return list;
	}

	@RequestMapping("sendvo")
	public BoardVO sendvo() {
		BoardVO vo = new BoardVO(1, "a", "으어으어", "나야", null, null, 5);

		return vo;
	}

	@RequestMapping("hello")
	public String hello() {

		return "Hello, everyone";
	}

}
