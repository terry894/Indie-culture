package org.hello.dao;
 
import java.util.List;
import java.util.Map;

import org.hello.domain.BoardVO;
import org.hello.domain.Criteria;
import org.hello.domain.File2VO;
import org.hello.domain.FileVO;

 
public interface BoardDAO {
 
	//게시글 작성
    public void create(BoardVO vo) throws Exception;
    
    //게시글 전부 보여주기
    public List<Map<String, Object>> listAll(Criteria cri) throws Exception;
    
    // 특정사용자 게시글 보여주기
    public List<BoardVO> UserAll(String b_writer) throws Exception;    // 그사람 게시글만 봄

    // 좋아요 순 보여주기
    public List<BoardVO> listLike() throws Exception;
    
    //조회수 순 보여주기
    public List<BoardVO> listSee() throws Exception;
    
    // 게시글마다 따로보여주기
    public List<Map<String, Object>> MusicAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> MovieAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> ActAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> GameAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> FreeAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> RentAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> PerformAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> EventmAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> NoticeAll(Criteria cri) throws Exception;
    
    
    
    // 상세게시판
    public BoardVO boardView(int b_no) throws Exception;
    // 게시글삭제
    public int delete(int b_no) throws Exception;
    //게시글 수정
    public void update(BoardVO vo) throws Exception;
// 조회수
    public void hitPlus(int b_no)throws Exception;
//파일첨부
    public int fileInsert(FileVO file) throws Exception;
    //파일 상세보기
    public FileVO fileDetail(int b_no) throws Exception;
    //파일 삭제
    public int filedelete(int b_no) throws Exception;
    
    
    public int fileInsert2(File2VO file) throws Exception;
    //파일 상세보기
    public File2VO fileDetail2(int b_no) throws Exception;
    //파일 삭제
    public int filedelete2(int b_no) throws Exception;
    
    
    
// 좋아요
    public void likePlus(int b_no)throws Exception;
    // 좋아요 취소
    public void likeminus(int b_no)throws Exception;
    
    // 게시글 전체보기 
   public List<Map<String, Object>> selectBoardList(Criteria cri);
   
   //게시글말다 갯수 세기(페이징 처리용)
    public int countBoardList();
    
    public int countBoardListMusic();
    public int countBoardListMovie();
    public int countBoardListAct();
    public int countBoardListGame();
    public int countBoardListCommunity();
    public int countBoardListRent();
    public int countBoardListPerform();
    public int countBoardListEvent();
    public int countBoardListNotice();
    
}
 
