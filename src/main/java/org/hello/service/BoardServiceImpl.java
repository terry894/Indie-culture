package org.hello.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
 
import org.hello.dao.BoardDAO;
import org.hello.domain.BoardVO;
import org.hello.domain.Criteria;
import org.hello.domain.File2VO;
import org.hello.domain.FileVO;
import org.springframework.stereotype.Service;
 
@Service
public class BoardServiceImpl implements BoardService {
 
    @Inject
    private BoardDAO dao;
    
    
    @Override
    public void create(BoardVO vo) throws Exception {
        dao.create(vo);
 
    }
 
    @Override
    public List<Map<String, Object>>listAll(Criteria cri) throws Exception {
        
        
        return dao.listAll(cri);
    }
    
    @Override
	public List<BoardVO> UserAll(String b_writer) throws Exception {
		return dao.UserAll(b_writer);
	}

	
 
    @Override
    public BoardVO boardView(int b_no) throws Exception {
        
        return dao.boardView(b_no);
    }
 
    @Override
    public int delete(int b_no) throws Exception {
         return dao.delete(b_no);
 
    }
 
    @Override
    public void update(BoardVO vo) throws Exception {
        
        dao.update(vo);
 
    }

	@Override
	public void hitPlus(int b_no) throws Exception {
	dao.hitPlus(b_no);
		
	}

	@Override
	public int fileInsert(FileVO file) throws Exception {
		return dao.fileInsert(file);
	}

	

	@Override
	public List<Map<String, Object>> MusicAll(Criteria cri) throws Exception {
		
		return dao.MusicAll(cri);
	}

	@Override
	public List<Map<String, Object>> MovieAll(Criteria cri) throws Exception {
		
		return dao.MovieAll(cri);
	}

	@Override
	public List<Map<String, Object>> ActAll(Criteria cri) throws Exception {
		
		return dao.ActAll(cri);
	}

	@Override
	public List<Map<String, Object>> GameAll(Criteria cri) throws Exception {
		
		return dao.GameAll(cri);
	}

	@Override
	public List<Map<String, Object>> FreeAll(Criteria cri) throws Exception {
		return dao.FreeAll(cri);
	}

	@Override
	public List<Map<String, Object>> RentAll(Criteria cri) throws Exception {
		return dao.RentAll(cri);
	}

	@Override
	public List<Map<String, Object>> PerformAll(Criteria cri) throws Exception {
		return dao.PerformAll(cri);
	}
	
	@Override
	public List<Map<String, Object>> EventmAll(Criteria cri) throws Exception {
		return dao.EventmAll(cri);
	}

	@Override
	public List<Map<String, Object>> NoticeAll(Criteria cri) throws Exception {
		return dao.NoticeAll(cri);
	}
	
	

	@Override
	public void likePlus(int b_no) throws Exception {
		dao.likePlus(b_no);
		
	}

	@Override
	public void likeminus(int b_no) throws Exception {
		dao.likeminus(b_no);
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		
		return dao.selectBoardList(cri);
	}

	@Override
	public int countBoardList() {
		
		return dao.countBoardList();
	}

	@Override
	public int countBoardListMusic() {
		
		return dao.countBoardListMusic();
	}

	@Override
	public int countBoardListMovie() {
		// TODO Auto-generated method stub
		return dao.countBoardListMovie();
	}

	@Override
	public int countBoardListAct() {
		// TODO Auto-generated method stub
		return dao.countBoardListAct();
	}

	@Override
	public int countBoardListGame() {
		// TODO Auto-generated method stub
		return dao.countBoardListGame();
	}

	@Override
	public int countBoardListCommunity() {
		// TODO Auto-generated method stub
		return dao.countBoardListCommunity();
	}

	@Override
	public int countBoardListRent() {
		// TODO Auto-generated method stub
		return dao.countBoardListRent();
	}

	@Override
	public int countBoardListPerform() {
		// TODO Auto-generated method stub
		return dao.countBoardListPerform();
	}

	@Override
	public List<BoardVO> listLike() throws Exception {
		// TODO Auto-generated method stub
		return dao.listLike();
	}

	@Override
	public List<BoardVO> listSee() throws Exception {
		// TODO Auto-generated method stub
		return dao.listSee();
	}

	@Override
	public int countBoardListEvent() {
		// TODO Auto-generated method stub
		return dao.countBoardListEvent();
	}

	@Override
	public int countBoardListNotice() {
		// TODO Auto-generated method stub
		return dao.countBoardListNotice();
	}

	@Override
	public FileVO fileDetail(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.fileDetail(b_no);
	}

	@Override
	public int filedelete(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.filedelete(b_no);
	}

	@Override
	public int fileInsert2(File2VO file) throws Exception {
		return dao.fileInsert2(file);	
		}

	@Override
	public File2VO fileDetail2(int b_no) throws Exception {
		return dao.fileDetail2(b_no);
	}

	@Override
	public int filedelete2(int b_no) throws Exception {
		return dao.filedelete2(b_no);
	}

	



	

 
}

