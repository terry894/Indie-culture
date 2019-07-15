package org.hello.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hello.domain.CommentVO;
import org.hello.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/board/") 
public class CommentController {
    
	 @Autowired
	   private CommentService service;


   
  
    @RequestMapping(value = "/commentInsert")
    @ResponseBody
    public void CommentPOST(@RequestParam int b_no ,@RequestParam String comment, HttpServletRequest httpRequest) throws Exception{
        System.out.println("commentPost �Դϴ�");
        
     //  String comment = (httpRequest.getParameter("comment"));
    //    int bno = Integer.parseInt(httpRequest.getParameter("b_no"));
        String b_writer = (httpRequest.getParameter("b_writer"));

        CommentVO vo = new CommentVO();
       vo.setB_no(b_no);
        vo.setB_writer(b_writer);
         vo.setComment(comment);
        vo.setC_no(1);
       
     System.out.println(b_no+"�� �Խñ� ������ "+comment+"�̴�");
        
     service.createComment(vo);
       
     
    
    }
    
    @RequestMapping(value = "/commentList") //��� ����Ʈ
    @ResponseBody
    public List<CommentVO> CommentList(@RequestParam int b_no ,Model model,HttpServletRequest httpRequest) throws Exception{
        
    	int bno = Integer.parseInt(httpRequest.getParameter("b_no"));
    	System.out.println(bno+"��ۺ����Դϴ�");
    	
    	//List<CommentVO> list = service.CommentAll(b_no);
    	
    	// model.addAttribute("comment", list);
    	 
		return service.CommentAll(b_no);
        
    }
    
    
    
    @RequestMapping(value="/commentUpdate") //��� ����  
    @ResponseBody
    private void CommentUpdate(@RequestParam int c_no, @RequestParam String comment) throws Exception{
        System.out.println(c_no+"�� ��� ������ �����մϴ�");
        CommentVO comments = new CommentVO();
        comments.setC_no(c_no);
      comments.setComment(comment);
        
      service.updateComment(comments);
    }
    
    
    @RequestMapping(value= "/commentDelete/{c_no}") //��� ����  
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int c_no) throws Exception{
        System.out.println(c_no+"�� ��ۻ����մϴ�");
        return service.deleteComment(c_no);
    }



    
}