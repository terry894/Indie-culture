package org.hello.web;

import javax.inject.Inject;

import org.hello.dao.MemberDAO;
import org.hello.domain.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestDAO {
    
    @Inject
    private MemberDAO dao;
    
    @RequestMapping(value = "/testDAO", method = RequestMethod.GET)
    public void testDAO(){
        MemberVO vo = new MemberVO();
        vo.setUser_id("Kim");
        vo.setUser_pw("15951");
        vo.setUser_email("abc@naver.com");
        
        dao.insertMember(vo);
    }
}
