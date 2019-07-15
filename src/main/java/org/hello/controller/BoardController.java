package org.hello.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.hello.domain.BoardVO;
import org.hello.domain.Criteria;
import org.hello.domain.File2VO;
import org.hello.domain.FileVO;
import org.hello.domain.PageMaker;
import org.hello.service.BoardService;
import org.hello.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
@Controller
@RequestMapping("/board/") //url��û��  /board/�� �����ϴ� ���� ���⼭ ó���Ѵ�. ex) board/abc , board/123 board/create
public class BoardController {
    
    @Autowired
    private BoardService service;
  
    @Inject
    private UserService uservice;
    
   
 
    @RequestMapping(value="/test")
	public ModelAndView openBoardList(Criteria cri) throws Exception {
	        
	    ModelAndView mav = new ModelAndView("/board/test");
	        
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(service.countBoardList());
	        
	    List<Map<String,Object>> list = service.selectBoardList(cri);
	    mav.addObject("list", list);
	    mav.addObject("pageMaker", pageMaker);
	        
	    return mav;
	}
	
    
    @RequestMapping(value="/picture/{b_no}")
  	public ModelAndView picture(@PathVariable("b_no") int b_no, Model model) throws Exception {
  	        
    	  model.addAttribute("files2", service.fileDetail2(b_no));
  	    ModelAndView mav = new ModelAndView("/board/picture");
  	       
  	    return mav;
  	}
  	
  
    
    
    
    
 

    
    @RequestMapping(value="/music")
   	public ModelAndView musicView(Criteria cri) throws Exception {
   	        
   	    ModelAndView mav = new ModelAndView("/board/music");
   	        
   	    PageMaker pageMaker = new PageMaker();
   	    pageMaker.setCri(cri);
   	    pageMaker.setTotalCount(service.countBoardListMusic());
   	        
   	    List<Map<String,Object>> list = service.MusicAll(cri);
   	    mav.addObject("music", list);
   	    mav.addObject("pageMaker", pageMaker);
   	        
   	    return mav;
   	}
    
    
    
    // ��ȭ ��ü����
   
	@RequestMapping(value = "/movie", method=RequestMethod.GET)
    public ModelAndView movieView(Criteria cri) throws Exception {
	        
	    ModelAndView mav = new ModelAndView("/board/movie");
	        
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(service.countBoardListMovie());
	        
	    List<Map<String,Object>> list = service.MovieAll(cri);
	    mav.addObject("movie", list);
	    mav.addObject("pageMaker", pageMaker);
	        
	    return mav;
	}
    
    
	 // ���� ��ü����
	   
		@RequestMapping(value = "/act", method=RequestMethod.GET)
	    public ModelAndView ActView(Criteria cri) throws Exception {
		        
		    ModelAndView mav = new ModelAndView("/board/act");
		        
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(service.countBoardListAct());
		        
		    List<Map<String,Object>> list = service.ActAll(cri);
		    mav.addObject("act", list);
		    mav.addObject("pageMaker", pageMaker);
		        
		    return mav;
		}
	
		 // ���� ��ü����
		   
		@RequestMapping(value = "/game", method=RequestMethod.GET)
	    public ModelAndView GameView(Criteria cri) throws Exception {
		        
		    ModelAndView mav = new ModelAndView("/board/game");
		        
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(service.countBoardListGame());
		        
		    List<Map<String,Object>> list = service.GameAll(cri);
		    mav.addObject("game", list);
		    mav.addObject("pageMaker", pageMaker);
		        
		    return mav;
		}
	
		 // �����Խ��� ��ü����
		   
		@RequestMapping(value = "/community", method=RequestMethod.GET)
	    public ModelAndView CommunityView(Criteria cri) throws Exception {
		        
		    ModelAndView mav = new ModelAndView("/board/community");
		        
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(service.countBoardListCommunity());
		        
		    List<Map<String,Object>> list = service.FreeAll(cri);
		    List<Map<String,Object>> list2 = service.RentAll(cri);
		    mav.addObject("comm", list);
		    mav.addObject("rent", list2);
		    mav.addObject("pageMaker", pageMaker);
		        
		    return mav;
		}
		
		
		 // ����Խ��� ��ü����
		   
		@RequestMapping(value = "/coronation", method=RequestMethod.GET)
	    public ModelAndView CoronationView(Criteria cri) throws Exception {
		        
		    ModelAndView mav = new ModelAndView("/board/coronation");
		        
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(service.countBoardListCommunity());
		        
		    
		    List<Map<String,Object>> list2 = service.RentAll(cri);
		    List<Map<String,Object>> list5 = service.FreeAll(cri);
		    
		    mav.addObject("rent", list2);
		    mav.addObject("hall", list5);
		    mav.addObject("pageMaker", pageMaker);
		        
		    return mav;
		}
		
		 // ���� ��ü����
		   
		@RequestMapping(value = "/perpormence", method=RequestMethod.GET)
	    public ModelAndView PerformView(Criteria cri) throws Exception {
		        
		    ModelAndView mav = new ModelAndView("/board/perpormence");
		        
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(service.countBoardListPerform());
		        
		    List<Map<String,Object>> list = service.PerformAll(cri);
		    mav.addObject("perform", list);
		    mav.addObject("pageMaker", pageMaker);
		        
		    return mav;
		}
		
	
		
    /*
    // �����Խ��� ��ü����
    @RequestMapping(value = "/community", method=RequestMethod.GET)
    public void CommuteView(Model model) throws Exception{
        
        System.out.println("��ü��� ������");
        
        model.addAttribute("comm", service.FreeAll());
        model.addAttribute("rent", service.RentAll());
     
       
    }
    */
    
   
 
    
   
     
    @RequestMapping(value="/create",method=RequestMethod.GET)
    public void createGET(BoardVO board, Model model) throws Exception{
        System.out.println(" /board/create �Դϴ�. GET���");
        
    }
    
   
    
   
    
    
    
    //����, �Խñ� ���ε�
    
    @RequestMapping(value = "/create",method=RequestMethod.POST )
    public String createPOST(BoardVO board, RedirectAttributes rttr,HttpServletRequest request, @RequestPart MultipartFile files,@RequestPart MultipartFile files2) throws Exception{
        System.out.println("/board/create POST��� �Դϴ�.");
        System.out.println(board.toString());
        
        FileVO fvo = new FileVO();
        File2VO fvo2 = new File2VO();
        
        if(files.isEmpty() && files2.isEmpty()){ //���ε��� ������ ���� ��
        	  service.create(board); //�Խñ� insert
        }else if(files2.isEmpty()){ // ������� ������
            String fileName = files.getOriginalFilename(); 
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            String fileUrl =  "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";
            
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
                destinationFile = new File(fileUrl+ destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile); 
            
            service.create(board); //�Խñ� insert
            
            fvo.setB_no(board.getB_no());
            fvo.setFileName(destinationFileName);
             fvo.setFileOriName(fileName);
            fvo.setFileUrl(fileUrl);
            
            service.fileInsert(fvo); //file insert
        }
        else if(files.isEmpty()) { // ÷�������� ���� ��
        	  String filename = files2.getOriginalFilename(); 
              String fileNameExtension2 = FilenameUtils.getExtension(filename).toLowerCase(); 
              File destinationFile2; 
              String destinationFileName2; 
              String fileurl =   "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\Thumnail\\";
              
              do { 
                  destinationFileName2 = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension2; 
                  destinationFile2 = new File(fileurl+ destinationFileName2); 
              } while (destinationFile2.exists()); 
              
              destinationFile2.getParentFile().mkdirs(); 
              files2.transferTo(destinationFile2); 
              
              service.create(board); //�Խñ� insert
              fvo2.setB_no(board.getB_no());
              fvo2.setFilename(destinationFileName2);
               fvo2.setFileOriName(filename);
              fvo2.setFileurl(fileurl);
              
              service.fileInsert2(fvo2); //file insert
        }
            
        else {
        	String fileName = files.getOriginalFilename(); 
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            String fileUrl = "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";
            
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
                destinationFile = new File(fileUrl+ destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile); 
            
            service.create(board); //�Խñ� insert
            
            fvo.setB_no(board.getB_no());
            fvo.setFileName(destinationFileName);
             fvo.setFileOriName(fileName);
            fvo.setFileUrl(fileUrl);
            
            service.fileInsert(fvo); //file insert
            
            String filename = files2.getOriginalFilename(); 
            String fileNameExtension2 = FilenameUtils.getExtension(filename).toLowerCase(); 
            File destinationFile2; 
            String destinationFileName2; 
            String fileurl =   "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\Thumnail\\";
            
            do { 
                destinationFileName2 = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension2; 
                destinationFile2 = new File(fileurl+ destinationFileName2); 
            } while (destinationFile2.exists()); 
            
            destinationFile2.getParentFile().mkdirs(); 
            files2.transferTo(destinationFile2); 
            
            fvo2.setB_no(board.getB_no());
            fvo2.setFilename(destinationFileName2);
             fvo2.setFileOriName(filename);
            fvo2.setFileurl(fileurl);
            
            service.fileInsert2(fvo2); //file insert
        	
        }
    
        rttr.addFlashAttribute("msg", "����");
        return "redirect:/board/listAll";
    }
    
    
    
    
    
    
    
    //create 2
    @RequestMapping(value="/create2",method=RequestMethod.GET)
    public void create2GET(BoardVO board, Model model,Criteria cri) throws Exception{
        System.out.println(" /board/create �Դϴ�. GET���");
        List<Map<String,Object>> list5 = service.EventmAll(cri);

        model.addAttribute("hall", list5);
    }
    
    
    //����, �Խñ� ���ε�
    
    @RequestMapping(value = "/create2",method=RequestMethod.POST )
    public String create2POST(BoardVO board, RedirectAttributes rttr,HttpServletRequest request, @RequestPart MultipartFile files,@RequestPart MultipartFile files2) throws Exception{
        System.out.println("/board/create POST��� �Դϴ�.");
        System.out.println(board.toString());
        
        FileVO fvo = new FileVO();
        File2VO fvo2 = new File2VO();
        
        if(files.isEmpty() && files2.isEmpty()){ //���ε��� ������ ���� ��
        	  service.create(board); //�Խñ� insert
        }else if(files2.isEmpty()){ // ������� ������
            String fileName = files.getOriginalFilename(); 
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            String fileUrl = "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";
            
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
                destinationFile = new File(fileUrl+ destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile); 
            
            service.create(board); //�Խñ� insert
            
            fvo.setB_no(board.getB_no());
            fvo.setFileName(destinationFileName);
             fvo.setFileOriName(fileName);
            fvo.setFileUrl(fileUrl);
            
            service.fileInsert(fvo); //file insert
        }
        else if(files.isEmpty()) { // ÷�������� ���� ��
        	  String filename = files2.getOriginalFilename(); 
              String fileNameExtension2 = FilenameUtils.getExtension(filename).toLowerCase(); 
              File destinationFile2; 
              String destinationFileName2; 
              String fileurl =   "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\Thumnail\\";
              
              do { 
                  destinationFileName2 = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension2; 
                  destinationFile2 = new File(fileurl+ destinationFileName2); 
              } while (destinationFile2.exists()); 
              
              destinationFile2.getParentFile().mkdirs(); 
              files2.transferTo(destinationFile2); 
              
              service.create(board); //�Խñ� insert
              fvo2.setB_no(board.getB_no());
              fvo2.setFilename(destinationFileName2);
               fvo2.setFileOriName(filename);
              fvo2.setFileurl(fileurl);
              
              service.fileInsert2(fvo2); //file insert
        }
            
        else {
        	String fileName = files.getOriginalFilename(); 
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            String fileUrl = "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";
            
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
                destinationFile = new File(fileUrl+ destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile); 
            
            service.create(board); //�Խñ� insert
            
            fvo.setB_no(board.getB_no());
            fvo.setFileName(destinationFileName);
             fvo.setFileOriName(fileName);
            fvo.setFileUrl(fileUrl);
            
            service.fileInsert(fvo); //file insert
            
            String filename = files2.getOriginalFilename(); 
            String fileNameExtension2 = FilenameUtils.getExtension(filename).toLowerCase(); 
            File destinationFile2; 
            String destinationFileName2; 
            String fileurl =   "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\Thumnail\\";
            
            do { 
                destinationFileName2 = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension2; 
                destinationFile2 = new File(fileurl+ destinationFileName2); 
            } while (destinationFile2.exists()); 
            
            destinationFile2.getParentFile().mkdirs(); 
            files2.transferTo(destinationFile2); 
            
            fvo2.setB_no(board.getB_no());
            fvo2.setFilename(destinationFileName2);
             fvo2.setFileOriName(filename);
            fvo2.setFileurl(fileurl);
            
            service.fileInsert2(fvo2); //file insert
        	
        }

      
        rttr.addFlashAttribute("msg", "����");
        return "redirect:/board/listAll";
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @RequestMapping(value="/event",method=RequestMethod.GET)

    public String eventForm(){

        return "/board/createEvent"; // /login/loginForm.jsp�� ���.

    }// end of loginForm

    
    
    //����, �Խñ� ���ε�
    
    @RequestMapping(value = "/event",method=RequestMethod.POST )
    public String createEventPOST(BoardVO board, RedirectAttributes rttr,HttpServletRequest request, @RequestPart MultipartFile files,@RequestPart MultipartFile files2) throws Exception{
        System.out.println("/board/create POST��� �Դϴ�.");
        System.out.println(board.toString());
        
        FileVO fvo = new FileVO();
        File2VO fvo2 = new File2VO();
        
        if(files.isEmpty() && files2.isEmpty()){ //���ε��� ������ ���� ��
        	  service.create(board); //�Խñ� insert
        }else if(files2.isEmpty()){ // ������� ������
            String fileName = files.getOriginalFilename(); 
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            String fileUrl = "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";
            
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
                destinationFile = new File(fileUrl+ destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile); 
            
            service.create(board); //�Խñ� insert
            
            fvo.setB_no(board.getB_no());
            fvo.setFileName(destinationFileName);
             fvo.setFileOriName(fileName);
            fvo.setFileUrl(fileUrl);
            
            service.fileInsert(fvo); //file insert
        }
        else if(files.isEmpty()) { // ÷�������� ���� ��
        	  String filename = files2.getOriginalFilename(); 
              String fileNameExtension2 = FilenameUtils.getExtension(filename).toLowerCase(); 
              File destinationFile2; 
              String destinationFileName2; 
              String fileurl =   "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\Thumnail\\";
              
              do { 
                  destinationFileName2 = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension2; 
                  destinationFile2 = new File(fileurl+ destinationFileName2); 
              } while (destinationFile2.exists()); 
              
              destinationFile2.getParentFile().mkdirs(); 
              files2.transferTo(destinationFile2); 
              
              service.create(board); //�Խñ� insert
              fvo2.setB_no(board.getB_no());
              fvo2.setFilename(destinationFileName2);
               fvo2.setFileOriName(filename);
              fvo2.setFileurl(fileurl);
              
              service.fileInsert2(fvo2); //file insert
        }
            
        else {
        	String fileName = files.getOriginalFilename(); 
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            String fileUrl = "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";
            
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
                destinationFile = new File(fileUrl+ destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile); 
            
            service.create(board); //�Խñ� insert
            
            fvo.setB_no(board.getB_no());
            fvo.setFileName(destinationFileName);
             fvo.setFileOriName(fileName);
            fvo.setFileUrl(fileUrl);
            
            service.fileInsert(fvo); //file insert
            
            String filename = files2.getOriginalFilename(); 
            String fileNameExtension2 = FilenameUtils.getExtension(filename).toLowerCase(); 
            File destinationFile2; 
            String destinationFileName2; 
            String fileurl =   "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\Thumnail\\";
            
            do { 
                destinationFileName2 = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension2; 
                destinationFile2 = new File(fileurl+ destinationFileName2); 
            } while (destinationFile2.exists()); 
            
            destinationFile2.getParentFile().mkdirs(); 
            files2.transferTo(destinationFile2); 
            
            fvo2.setB_no(board.getB_no());
            fvo2.setFilename(destinationFileName2);
             fvo2.setFileOriName(filename);
            fvo2.setFileurl(fileurl);
            
            service.fileInsert2(fvo2); //file insert
        	
        }
      
        rttr.addFlashAttribute("msg", "����");
        return "redirect:/board/listAll";
    }
    
    
    
    
   

   
    
    @RequestMapping("/userpage/{b_writer}") 
    private String otherDetail(@PathVariable ("b_writer") String b_writer, Model model) throws Exception{
        
    	
    	System.out.println(b_writer);
    	 model.addAttribute("list", service.UserAll(b_writer));
    	
    	model.addAttribute("user",uservice.OtherInfo());
        return "/board/userpage";
    }

    
    
   
    
//  ���������� 
   @RequestMapping(value = "/mypage/{a_id}", method=RequestMethod.GET)
   public String mypageView(Model model, Criteria cri) throws Exception{
       
       System.out.println("my ������");
       
       model.addAttribute("list", service.listAll(cri));
    
       return "/board/mypage";
   }
    
    /*
   @RequestMapping("/mypage/{a_id}") 
   private String boardDetail(@PathVariable String a_id, Model model) throws Exception{
       
	   model.addAttribute("list", service.listAll());
       
       return "/board/mypage";
   }
   */

 
 
// �� �Խ���, ��ȸ�� �߰� 
    @RequestMapping(value="/{b_no}",method=RequestMethod.GET)
    public ModelAndView view(@PathVariable("b_no") int b_no, Model model) throws Exception{
        
    	
        BoardVO board = service.boardView(b_no);
       
        service.hitPlus(b_no);
       
        model.addAttribute("files", service.fileDetail(b_no)); //�߰�
        model.addAttribute("files2", service.fileDetail2(b_no)); //�߰�
        
 
        return new ModelAndView("boardView","board",board);
    }
    
    //���ƿ�
    
    
    
    @RequestMapping(value="/like",method=RequestMethod.GET)
    public String like(HttpServletRequest httpRequest, Model model) throws Exception{
       String boardId=(httpRequest.getParameter("boardId"));
       int boardno= Integer.parseInt(httpRequest.getParameter("boardno"));
     
       
       System.out.println(boardId +"����"+boardno+"���ۿ� ���ƿ並 �������ϴ�");
       

       service.likePlus(boardno);
       
     
       
	return boardId;

        
    }
    
    
    @RequestMapping(value="/likecancel",method=RequestMethod.GET)
    public String likecancel(HttpServletRequest httpRequest) throws Exception{
       String boardId=(httpRequest.getParameter("boardId"));
       int boardno= Integer.parseInt(httpRequest.getParameter("boardno"));
     
       System.out.println(boardId +"����"+boardno+"���ۿ� ���ƿ並 ����߽��ϴ�");
       
       service.likeminus(boardno);
	return boardId;

        
    }
    
    // ��ü���� 

    @RequestMapping(value = "/listAll", method=RequestMethod.GET)
    public void listAll(BoardVO board , Model model,Criteria cri) throws Exception{
        
    	
    	
        System.out.println("��ü��� ������");
        List<Map<String,Object>> list = service.MusicAll(cri);
        List<Map<String,Object>> list2 = service.MovieAll(cri);
        List<Map<String,Object>> list3 = service.ActAll(cri);
        List<Map<String,Object>> list4 = service.GameAll(cri);
        List<Map<String,Object>> list5 = service.EventmAll(cri);
        List<Map<String,Object>> list6 = service.NoticeAll(cri);
        
       
        
      //  model.addAttribute("files",service.fileDetail(b_no));
      //  model.addAttribute("list", service.listAll());
        model.addAttribute("music", list);
        model.addAttribute("movie", list2);
        model.addAttribute("act", list3);
        model.addAttribute("game", list4);
        model.addAttribute("event", list5);
        model.addAttribute("notice", list6);
       
        model.addAttribute("like", service.listLike());
        model.addAttribute("see", service.listSee());
       
        
        
    }
    
    
    
    
    
    // ���� �ٿ�ε�
    @RequestMapping("/fileDown/{b_no}")
    private void fileDown(@PathVariable int b_no, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        request.setCharacterEncoding("UTF-8");
        FileVO fileVO = service.fileDetail(b_no);
        
        //���� ���ε�� ��� 
        try{
            String fileUrl = fileVO.getFileUrl();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileVO.getFileName();
            
            //���� ������ ���ϸ� 
            String oriFileName = fileVO.getFileOriName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            //������ �о� ��Ʈ���� ���  
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //���� �ٿ�ε� ��� ���� 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 �̻�.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // �ѱ� ���ϸ� ó��
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('������ ã�� �� �����ϴ�');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    }


    
   

    
    
    
    
    
    // �����Խ���
    @RequestMapping(value="/post/{b_no}", method=RequestMethod.GET)
    public ModelAndView updateForm(@PathVariable("b_no") int b_no, Model model) throws Exception{
            
        BoardVO board = service.boardView(b_no);
        service.hitPlus(b_no);
        model.addAttribute("files", service.fileDetail(b_no)); //�߰�
        model.addAttribute("files2", service.fileDetail2(b_no)); //�߰�
        return new ModelAndView("board/boardUpdate","board",board);
    }
        /*
    //�Խñ� ����(PATCH)
    @RequestMapping(value="/post/{b_no}", method= {RequestMethod.PATCH,RequestMethod.POST})
    public String update(@ModelAttribute("BoardVO")BoardVO board,@PathVariable("b_no") int b_no) throws Exception{
            
        service.update(board);
      
        
        
        return "redirect:/board/"+b_no;
    }
*/
    
    //�Խñ� ����(PATCH)
    @RequestMapping(value="/post/{b_no}", method= {RequestMethod.PATCH,RequestMethod.POST})
    public String update(@ModelAttribute("BoardVO")BoardVO board,@PathVariable("b_no") int b_no, RedirectAttributes rttr,HttpServletRequest request, @RequestPart MultipartFile files,@RequestPart MultipartFile files2) throws Exception{
          
FileVO fvo = new FileVO();
File2VO fvo2 = new File2VO();
        
if(files.isEmpty() && files2.isEmpty()){ //���ε��� ������ ���� ��
	 service.update(board); //�Խñ� ����
}else if(files2.isEmpty()){ // ������� ������
  String fileName = files.getOriginalFilename(); 
  String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
  File destinationFile; 
  String destinationFileName; 
  String fileUrl = "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";
  
  do { 
      destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
      destinationFile = new File(fileUrl+ destinationFileName); 
  } while (destinationFile.exists()); 
  
  destinationFile.getParentFile().mkdirs(); 
  files.transferTo(destinationFile); 
  
	 service.update(board); //�Խñ� ����
  
  fvo.setB_no(board.getB_no());
  fvo.setFileName(destinationFileName);
   fvo.setFileOriName(fileName);
  fvo.setFileUrl(fileUrl);
  
  service.fileInsert(fvo); //file insert
}
else if(files.isEmpty()) { // ÷�������� ���� ��
	  String filename = files2.getOriginalFilename(); 
    String fileNameExtension2 = FilenameUtils.getExtension(filename).toLowerCase(); 
    File destinationFile2; 
    String destinationFileName2; 
    String fileurl =   "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\Thumnail\\";
    
    do { 
        destinationFileName2 = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension2; 
        destinationFile2 = new File(fileurl+ destinationFileName2); 
    } while (destinationFile2.exists()); 
    
    destinationFile2.getParentFile().mkdirs(); 
    files2.transferTo(destinationFile2); 
    
	 service.update(board); //�Խñ� ����
    fvo2.setB_no(board.getB_no());
    fvo2.setFilename(destinationFileName2);
     fvo2.setFileOriName(filename);
    fvo2.setFileurl(fileurl);
    
    service.fileInsert2(fvo2); //file insert
}
  
else {
	String fileName = files.getOriginalFilename(); 
  String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
  File destinationFile; 
  String destinationFileName; 
  String fileUrl = "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";
  
  do { 
      destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
      destinationFile = new File(fileUrl+ destinationFileName); 
  } while (destinationFile.exists()); 
  
  destinationFile.getParentFile().mkdirs(); 
  files.transferTo(destinationFile); 
  
	 service.update(board); //�Խñ� ����
  
  fvo.setB_no(board.getB_no());
  fvo.setFileName(destinationFileName);
   fvo.setFileOriName(fileName);
  fvo.setFileUrl(fileUrl);
  
  service.fileInsert(fvo); //file insert
  
  String filename = files2.getOriginalFilename(); 
  String fileNameExtension2 = FilenameUtils.getExtension(filename).toLowerCase(); 
  File destinationFile2; 
  String destinationFileName2; 

  String fileurl =   "C:\\dev\\workspace\\Version1.6\\src\\main\\webapp\\WEB-INF\\Thumnail\\";
  
  do { 
      destinationFileName2 = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension2; 
      destinationFile2 = new File(fileurl+ destinationFileName2); 
  } while (destinationFile2.exists()); 
  
  destinationFile2.getParentFile().mkdirs(); 
  files2.transferTo(destinationFile2); 
  
  fvo2.setB_no(board.getB_no());
  fvo2.setFilename(destinationFileName2);
   fvo2.setFileOriName(filename);
  fvo2.setFileurl(fileurl);
  
  service.fileInsert2(fvo2); //file insert
	
}
        rttr.addFlashAttribute("msg", "����");
        return "redirect:/board/"+b_no;
    }
    
    
    
    
    
  //�Խñ� ����(DELETE)
    @RequestMapping(value="/post")
    public String delete(@RequestParam(value="b_no") int b_no) throws Exception{
            
        service.delete(b_no);
        service.filedelete(b_no);
        service.filedelete2(b_no);
        return "redirect:/board/listAll";
    }

    
    
    

    
    
    
  //���ϸ� ����(DELETE)
    @RequestMapping(value="/deletefile", method=RequestMethod.GET)
    public int deletefile(HttpServletRequest httpRequest) throws Exception{
    	 int boardno= Integer.parseInt(httpRequest.getParameter("boardno"));
    	System.out.println("������ �����մϴ�");
    	System.out.println(boardno);
         service.filedelete(boardno);
         return boardno;
    }
    
    
    @RequestMapping(value="/deletefile2", method=RequestMethod.GET)
    public int deletefile2(HttpServletRequest httpRequest) throws Exception{
    	 int boardno= Integer.parseInt(httpRequest.getParameter("boardno"));
    	System.out.println("������ �����մϴ�");
    	System.out.println(boardno);
         service.filedelete2(boardno);
         return boardno;
    }



// ȸ������ 
	@RequestMapping(value="/signup",method=RequestMethod.GET)
    public void signupGET(BoardVO board, Model model) throws Exception{
        System.out.println(" /board/signup �Դϴ�. GET���");
        
    }
    
  
	
	
	/*
	@RequestMapping(value="/test")
	public ModelAndView openBoardList(Criteria cri) throws Exception {
	        
	    ModelAndView mav = new ModelAndView("/board/test");
	        
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(service.countBoardList());
	        
	    List<Map<String,Object>> list = service.selectBoardList(cri);
	    mav.addObject("list", list);
	    mav.addObject("pageMaker", pageMaker);
	        
	    return mav;
	        
	}
	*/
/*
	@RequestMapping(value="/test")
	public ModelAndView openBoardList(Criteria cri) throws Exception {
	        
	    ModelAndView mav = new ModelAndView("/board/test");
	        
	   
	        
	    return mav;
	        
	}
	
	*/
	
	


   
}

