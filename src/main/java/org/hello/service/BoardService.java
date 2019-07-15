package org.hello.service;
import java.util.List;
import java.util.Map;

import org.hello.domain.BoardVO;
import org.hello.domain.Criteria;
import org.hello.domain.File2VO;
import org.hello.domain.FileVO;

 
public interface BoardService {
    
    // 게시글작성
    public void create(BoardVO vo) throws Exception;
    
    // 게시글 전체보기
    public List<Map<String, Object>> listAll(Criteria cri) throws Exception;
    public List<BoardVO> UserAll(String b_writer) throws Exception;    // 그사람 게시글만 봄

    
    public List<BoardVO> listLike() throws Exception;
    public List<BoardVO> listSee() throws Exception;
    
    public BoardVO boardView(int b_no) throws Exception;
    
    public List<Map<String, Object>> MusicAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> MovieAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> ActAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> GameAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> FreeAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> RentAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> PerformAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> EventmAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> NoticeAll(Criteria cri) throws Exception;
    
   
    
    public int delete(int b_no) throws Exception;
    
    public void update(BoardVO vo) throws Exception;

    public void hitPlus(int b_no)throws Exception;

    public int fileInsert(FileVO file) throws Exception;

    public FileVO fileDetail(int b_no) throws Exception;
    public int filedelete(int b_no) throws Exception;

    public int fileInsert2(File2VO file) throws Exception;
    //파일 상세보기
    public File2VO fileDetail2(int b_no) throws Exception;
    //파일 삭제
    public int filedelete2(int b_no) throws Exception;
    
    
    public void likePlus(int b_no)throws Exception;
    public void likeminus(int b_no)throws Exception;
    
    
    public List<Map<String, Object>> selectBoardList(Criteria cri);
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

