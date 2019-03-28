package itachi.uchiha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itachi.uchiha.dao.MemberDAO;


import itachi.uchiha.domain.MemberDTO;




@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	
}
