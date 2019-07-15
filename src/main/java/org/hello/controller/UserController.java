package org.hello.controller;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hello.domain.Criteria;
import org.hello.domain.PageMaker;
import org.hello.domain.UserVO;
import org.hello.service.BoardService;
import org.hello.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/board/") //url��û��  /board/�� �����ϴ� ���� ���⼭ ó���Ѵ�. ex) board/abc , board/123 board/create
public class UserController {
    
    @Inject
    private UserService service;
    
    @Inject
    private BoardService bservice;
   
  
    @RequestMapping(value = "/signup",method=RequestMethod.POST )
    public String createPOST(UserVO user,RedirectAttributes rttr) throws Exception{
        System.out.println("/board/signup POST��� �Դϴ�.");
        System.out.println(user.toString());
        
        service.createUser(user);
       
       
        rttr.addFlashAttribute("msg", "����");
        return "redirect:/board/login";


    }
    
  
    /*
 // �α��� ���� ���� �κ�

    @RequestMapping(value="/login",method=RequestMethod.GET)
    public void loginGET(UserVO board, Model model) throws Exception{
        System.out.println(" /board/login �Դϴ�. GET���");
        
    }
   */
    
 // �α��� ���� ���� �κ�

    @RequestMapping(value="/login",method=RequestMethod.GET)

    public String loginForm(){

        return "/board/login"; // /login/loginForm.jsp�� ���.

    }// end of loginForm



    // �α��� ó���ϴ� �κ�

    @RequestMapping(value="/loginProcess",method=RequestMethod.POST)

    public String loginProcess(HttpSession session,UserVO vo) throws Exception{

        String returnURL = "";

        if ( session.getAttribute("login") != null ){

            // ������ login�̶� ���� ���� �����Ѵٸ�

            session.removeAttribute("login"); // �������� ������ �ش�.

        }


        // �α����� �����ϸ� UserVO ��ü�� ��ȯ��.

        UserVO vo2 = service.login(vo);

         

        if ( vo2 != null ){ // �α��� ����

            session.setAttribute("login", vo2); // ���ǿ� login���̶� �̸����� UserVO ��ü�� ������ ��. 
            
            

            returnURL = "redirect:/board/listAll"; // �α��� ������ �Խñ� ����������� �ٷ� �̵��ϵ��� �ϰ�

        }else { // �α��ο� ������ ���

            returnURL = "redirect:/board/login"; // �α��� ������ �ٽ� ������ ��

        }

        System.out.println("id �� : " + vo.a_id);
        System.out.println("pw �� : " + vo.a_pw);
        System.out.println("���� �� : " + session);
    
        return returnURL; // ������ ������ returnURL �� ��ȯ�ؼ� �̵���Ŵ

    }
    
  

    // �α׾ƿ� �ϴ� �κ�

    @RequestMapping(value="/logout")

    public String logout(HttpSession session) {

        session.invalidate(); // ���� ��ü�� ��������

//      session.removeAttribute("login"); // �ϳ��� �Ϸ��� �̷��� �ص� ��.
     
        System.out.println("���� : " + session + "����");
        return "redirect:/board/listAll"; // �α׾ƿ� �� �Խñ� ������� �̵��ϵ���...��

    }
    
    /*
    @RequestMapping(value="/{a_id}",method=RequestMethod.GET)
    public ModelAndView view(@PathVariable("a_id") UserVO a_id) throws Exception{
        
    	
        UserVO board = (UserVO) service.UserInfo();
       
        
        return new ModelAndView("/board/mypage","board",board);
    }
*/
    
    
    
   
    
    
    @RequestMapping(value="/updateUser/{a_id}",method=RequestMethod.GET)
    public ModelAndView MyPageSession(ModelAndView mv) throws Exception{
        mv.setViewName("/board/userUpdate");
        return mv;
        
    }
    
   

        
    //ȸ�� ����(PATCH)
    @RequestMapping(value="/updateUser/{a_id}", method= {RequestMethod.PATCH,RequestMethod.POST})
    public String updateUser(@ModelAttribute("UserVO")UserVO user,@PathVariable("a_id") String a_id,
    		HttpSession session) throws Exception{
            
        service.updateUser(user);
        session.setAttribute("login", user);
        return "redirect:/board/mypage/{a_id}";
    }
    
    
  //ȸ�� ����(DELETE)
    @RequestMapping(value="/userdelete")
    public String delete(@RequestParam(value="a_id") String a_id, HttpSession session) throws Exception{
            
        service.deleteUser(a_id);
        session.invalidate(); // ���� ��ü�� ��������
        return "redirect:/board/listAll";
    }

    
    
    /*
    // ������ ȸ������  �̿ϼ�
    @RequestMapping(value="/adminupdateUser/{a_id}",method=RequestMethod.GET)
    public ModelAndView UserInfo(ModelAndView mv,String a_id) throws Exception{
    	
    	
    	UserVO user = service.UserInfo();
    	 return new ModelAndView("board/adminuserUpdate","user", mv);
       
        
    }
    
    
    //������ ȸ�� ����(PATCH)  �̿ϼ� 
    @RequestMapping(value="/adminupdateUser/{a_id}", method= {RequestMethod.PATCH,RequestMethod.POST})
    public String adminupdateUser(@ModelAttribute("UserVO")UserVO user,@PathVariable("a_id") String a_id) throws Exception{
            
        service.updateUser(user);
        
        return "redirect://localhost:8090/board/adminshowUser";
    }
    */
    
    
    
    //������ ȸ�� ����(DELETE)
    @RequestMapping(value="/admin/userdelete" )
    public String deleteUser(@RequestParam(value="a_id") String a_id) throws Exception{
            
        service.deleteUser(a_id);
       
        return "redirect:/board/admin/page";
    }
    
    
    
    /*
    
    // ����� ��ü����
    @RequestMapping(value="/admin/showUser",method=RequestMethod.GET)

    public String adminForm(Model model) throws Exception{
    	
System.out.println("��ü��� ������");
        
        model.addAttribute("user", service.listAllUser());

        return "/board/adminUser"; // /login/loginForm.jsp�� ���.

    }// end of loginForm
    */
    
    
    
    @RequestMapping(value="/admin/page",method=RequestMethod.GET)

    public String adminForm(HttpServletRequest request, HttpServletResponse response,Model model,Criteria cri) throws Exception{
    	
    	 HttpSession session = request.getSession();
    	UserVO user = (UserVO)session.getAttribute("login");
    	
    	System.out.println(user.a_id);
    	System.out.println(user.a_pw);
    	
    	
    	 PageMaker pageMaker = new PageMaker();
 	    pageMaker.setCri(cri);
 	    pageMaker.setTotalCount(bservice.countBoardList());
 	    
   	 List<Map<String,Object>> list = bservice.selectBoardList(cri);
    	
    	if(user.a_id.equals("admin")) {
    	 model.addAttribute("user", service.listAllUser());
    	 model.addAttribute("admin",list);
    	 model.addAttribute("pageMaker", pageMaker);
        return "/board/adminPage"; // /login/loginForm.jsp�� ���.
    	}
    	
    	else {
    		System.out.println("warning!!" + user.a_id +"���� �����ڰ� �ƴմϴ� �̵��� �źεǾ����ϴ�");
    		System.out.println("�ùٸ��� ���� �������� ���� ��������");
    		 session.invalidate(); // ���� ��ü�� ��������
    		return "redirect:/board/listAll";
    		
    	}
    }// end of loginForm
    
    
   
    

} // end of controller

