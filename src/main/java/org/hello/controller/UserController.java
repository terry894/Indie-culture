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
@RequestMapping("/board/") //url요청이  /board/로 시작하는 것은 여기서 처리한다. ex) board/abc , board/123 board/create
public class UserController {
    
    @Inject
    private UserService service;
    
    @Inject
    private BoardService bservice;
   
  
    @RequestMapping(value = "/signup",method=RequestMethod.POST )
    public String createPOST(UserVO user,RedirectAttributes rttr) throws Exception{
        System.out.println("/board/signup POST방식 입니다.");
        System.out.println(user.toString());
        
        service.createUser(user);
       
       
        rttr.addFlashAttribute("msg", "성공");
        return "redirect:/board/login";


    }
    
  
    /*
 // 로그인 폼을 띄우는 부분

    @RequestMapping(value="/login",method=RequestMethod.GET)
    public void loginGET(UserVO board, Model model) throws Exception{
        System.out.println(" /board/login 입니다. GET방식");
        
    }
   */
    
 // 로그인 폼을 띄우는 부분

    @RequestMapping(value="/login",method=RequestMethod.GET)

    public String loginForm(){

        return "/board/login"; // /login/loginForm.jsp를 띄움.

    }// end of loginForm



    // 로그인 처리하는 부분

    @RequestMapping(value="/loginProcess",method=RequestMethod.POST)

    public String loginProcess(HttpSession session,UserVO vo) throws Exception{

        String returnURL = "";

        if ( session.getAttribute("login") != null ){

            // 기존에 login이란 세션 값이 존재한다면

            session.removeAttribute("login"); // 기존값을 제거해 준다.

        }


        // 로그인이 성공하면 UserVO 객체를 반환함.

        UserVO vo2 = service.login(vo);

         

        if ( vo2 != null ){ // 로그인 성공

            session.setAttribute("login", vo2); // 세션에 login인이란 이름으로 UserVO 객체를 저장해 놈. 
            
            

            returnURL = "redirect:/board/listAll"; // 로그인 성공시 게시글 목록페이지로 바로 이동하도록 하고

        }else { // 로그인에 실패한 경우

            returnURL = "redirect:/board/login"; // 로그인 폼으로 다시 가도록 함

        }

        System.out.println("id 값 : " + vo.a_id);
        System.out.println("pw 값 : " + vo.a_pw);
        System.out.println("세션 값 : " + session);
    
        return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴

    }
    
  

    // 로그아웃 하는 부분

    @RequestMapping(value="/logout")

    public String logout(HttpSession session) {

        session.invalidate(); // 세션 전체를 날려버림

//      session.removeAttribute("login"); // 하나씩 하려면 이렇게 해도 됨.
     
        System.out.println("세션 : " + session + "종료");
        return "redirect:/board/listAll"; // 로그아웃 후 게시글 목록으로 이동하도록...함

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
    
   

        
    //회원 수정(PATCH)
    @RequestMapping(value="/updateUser/{a_id}", method= {RequestMethod.PATCH,RequestMethod.POST})
    public String updateUser(@ModelAttribute("UserVO")UserVO user,@PathVariable("a_id") String a_id,
    		HttpSession session) throws Exception{
            
        service.updateUser(user);
        session.setAttribute("login", user);
        return "redirect:/board/mypage/{a_id}";
    }
    
    
  //회원 삭제(DELETE)
    @RequestMapping(value="/userdelete")
    public String delete(@RequestParam(value="a_id") String a_id, HttpSession session) throws Exception{
            
        service.deleteUser(a_id);
        session.invalidate(); // 세션 전체를 날려버림
        return "redirect:/board/listAll";
    }

    
    
    /*
    // 관리자 회원수정  미완성
    @RequestMapping(value="/adminupdateUser/{a_id}",method=RequestMethod.GET)
    public ModelAndView UserInfo(ModelAndView mv,String a_id) throws Exception{
    	
    	
    	UserVO user = service.UserInfo();
    	 return new ModelAndView("board/adminuserUpdate","user", mv);
       
        
    }
    
    
    //관리자 회원 수정(PATCH)  미완성 
    @RequestMapping(value="/adminupdateUser/{a_id}", method= {RequestMethod.PATCH,RequestMethod.POST})
    public String adminupdateUser(@ModelAttribute("UserVO")UserVO user,@PathVariable("a_id") String a_id) throws Exception{
            
        service.updateUser(user);
        
        return "redirect://localhost:8090/board/adminshowUser";
    }
    */
    
    
    
    //관리자 회원 삭제(DELETE)
    @RequestMapping(value="/admin/userdelete" )
    public String deleteUser(@RequestParam(value="a_id") String a_id) throws Exception{
            
        service.deleteUser(a_id);
       
        return "redirect:/board/admin/page";
    }
    
    
    
    /*
    
    // 사용자 전체보기
    @RequestMapping(value="/admin/showUser",method=RequestMethod.GET)

    public String adminForm(Model model) throws Exception{
    	
System.out.println("전체목록 페이지");
        
        model.addAttribute("user", service.listAllUser());

        return "/board/adminUser"; // /login/loginForm.jsp를 띄움.

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
        return "/board/adminPage"; // /login/loginForm.jsp를 띄움.
    	}
    	
    	else {
    		System.out.println("warning!!" + user.a_id +"님은 관리자가 아닙니다 이동이 거부되었습니다");
    		System.out.println("올바르지 않은 접근으로 강제 세션종료");
    		 session.invalidate(); // 세션 전체를 날려버림
    		return "redirect:/board/listAll";
    		
    	}
    }// end of loginForm
    
    
   
    

} // end of controller

