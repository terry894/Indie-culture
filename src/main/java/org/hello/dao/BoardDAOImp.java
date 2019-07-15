package org.hello.dao;
 
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.hello.domain.BoardVO;
import org.hello.domain.Criteria;
import org.hello.domain.File2VO;
import org.hello.domain.FileVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository
public class BoardDAOImp implements BoardDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    private static String namespace = "org.hello.mapper.BoardMapper";
 
    //게시판추가
    @Override
    public void create(BoardVO vo) throws Exception {
        
        sqlSession.insert(namespace+".insertBoard", vo);
 
    }
    
    //게시판보기
    @Override
    public List<Map<String, Object>> listAll(Criteria cri) throws Exception {
        
       
        return sqlSession.selectList(namespace+".listBoard"); 

    }
    
    @Override
	public List<BoardVO> UserAll(String b_writer) throws Exception {
    	sqlSession.selectList(namespace+".UserBoard", b_writer);
        return sqlSession.selectList(namespace+".UserBoard",b_writer); 
	}

    
    //게시판 상세
    @Override
    public BoardVO boardView(int b_no) throws Exception {
        sqlSession.selectOne(namespace+".boardView", b_no);
        return sqlSession.selectOne(namespace+".boardView", b_no);
    }
 
    //게시판 삭제
    @Override
    public int delete(int b_no) throws Exception {
        sqlSession.delete(namespace+".deleteBoard", b_no);
        return  sqlSession.delete(namespace+".deleteBoard", b_no);
     
 
    }
 
    //게시판 수정
    @Override
    public void update(BoardVO vo) throws Exception {
        sqlSession.update(namespace+".updateBoard", vo);
 
    }

	@Override
	public void hitPlus(int b_no) throws Exception {
		sqlSession.update(namespace+".hitPlus",b_no);
		
	}

	@Override
	public int fileInsert(FileVO file) throws Exception {
	//	sqlSession.insert(namespace+".fileInsert", file);
		return sqlSession.insert(namespace+".fileInsert", file);
	}

	@Override
	public FileVO fileDetail(int b_no) throws Exception {
		sqlSession.selectOne(namespace+".fileDetail", b_no);
		return sqlSession.selectOne(namespace+".fileDetail", b_no);
	}

	
	// 음악 영화 연극 게임 보여주기
	@Override
	public List<Map<String, Object>>MusicAll(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+".MusicBoard", cri);
	}

	@Override
	public List<Map<String, Object>> MovieAll(Criteria cri) throws Exception {
	        return sqlSession.selectList(namespace+".MovieBoard", cri); 
	}

	@Override
	public List<Map<String, Object>> ActAll(Criteria cri) throws Exception {
		 return sqlSession.selectList(namespace+".ActBoard", cri); 
	}

	@Override
	public List<Map<String, Object>> GameAll(Criteria cri) throws Exception {
        return sqlSession.selectList(namespace+".GameBoard",cri); 
	}

	@Override
	public List<Map<String, Object>> FreeAll(Criteria cri) throws Exception {
        return sqlSession.selectList(namespace+".FreeBoard",cri); 
	}

	@Override
	public List<Map<String, Object>> RentAll(Criteria cri) throws Exception {
        return sqlSession.selectList(namespace+".RentBoard",cri); 
	}

	@Override
	public List<Map<String, Object>> PerformAll(Criteria cri) throws Exception {
        return sqlSession.selectList(namespace+".PerformBoard",cri); 
	}

	
	@Override
	public List<Map<String, Object>> EventmAll(Criteria cri) throws Exception {
		  return sqlSession.selectList(namespace+".EventBoard",cri); 
	}

	@Override
	public List<Map<String, Object>> NoticeAll(Criteria cri) throws Exception {
		  return sqlSession.selectList(namespace+".NoticeBoard",cri); 
	}
	
	
	@Override
	public void likePlus(int b_no) throws Exception {
		sqlSession.update(namespace+".Likeplus",b_no);
		
	}

	@Override
	public void likeminus(int b_no) throws Exception {
		sqlSession.update(namespace+".Likeminus",b_no);
		
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return sqlSession.selectList(namespace+".listBoard2", cri);

	
	}

	
	

	@Override
	public int countBoardList() {
		sqlSession.selectOne(namespace+".countBoardList");
		return  sqlSession.selectOne(namespace+".countBoardList");
	}

	@Override
	public int countBoardListMusic() {
		sqlSession.selectOne(namespace+".countBoardListMusic");
		return  sqlSession.selectOne(namespace+".countBoardListMusic");
	}

	@Override
	public int countBoardListMovie() {
		sqlSession.selectOne(namespace+".countBoardListMovie");
		return  sqlSession.selectOne(namespace+".countBoardListMovie");
	}

	

	@Override
	public int countBoardListAct() {
		sqlSession.selectOne(namespace+".countBoardListAct");
		return  sqlSession.selectOne(namespace+".countBoardListAct");
	}

	@Override
	public int countBoardListGame() {
		sqlSession.selectOne(namespace+".countBoardListGame");
		return  sqlSession.selectOne(namespace+".countBoardListGame");
	}

	@Override
	public int countBoardListCommunity() {
		sqlSession.selectOne(namespace+".countBoardListCommunity");
		return  sqlSession.selectOne(namespace+".countBoardListCommunity");
	}

	@Override
	public int countBoardListRent() {
		sqlSession.selectOne(namespace+".countBoardListRent");
		return  sqlSession.selectOne(namespace+".countBoardListRent");
	}

	@Override
	public int countBoardListPerform() {
		sqlSession.selectOne(namespace+".countBoardListPerform");
		return  sqlSession.selectOne(namespace+".countBoardListPerform");
	}
	@Override
	public int countBoardListEvent() {
		sqlSession.selectOne(namespace+".countBoardListEvent");
		return  sqlSession.selectOne(namespace+".countBoardListEvent");
	}

	@Override
	public int countBoardListNotice() {
		sqlSession.selectOne(namespace+".countBoardListNotice");
		return  sqlSession.selectOne(namespace+".countBoardListNotice");
	}

	@Override
	public List<BoardVO> listLike() throws Exception {
		 sqlSession.selectList(namespace+".likeboard");
	        return sqlSession.selectList(namespace+".likeboard"); 
	}

	@Override
	public List<BoardVO> listSee() throws Exception {
		 sqlSession.selectList(namespace+".seeBoard");
	        return sqlSession.selectList(namespace+".seeBoard"); 


	}

	@Override
	public int filedelete(int b_no) throws Exception {
		  sqlSession.delete(namespace+".fileDelete", b_no);
	        return  sqlSession.delete(namespace+".fileDelete", b_no);
	}

	@Override
	public int fileInsert2(File2VO file) throws Exception {
		return sqlSession.insert(namespace+".fileInsert2", file);
	}

	@Override
	public File2VO fileDetail2(int b_no) throws Exception {
		sqlSession.selectOne(namespace+".fileDetail2", b_no);
		return sqlSession.selectOne(namespace+".fileDetail2", b_no);
	}

	@Override
	public int filedelete2(int b_no) throws Exception {
		 sqlSession.delete(namespace+".fileDelete2", b_no);
	        return  sqlSession.delete(namespace+".fileDelete2", b_no);
	}

	
	

	

	
	


	
 
}

