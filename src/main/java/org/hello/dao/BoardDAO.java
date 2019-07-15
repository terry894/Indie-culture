package org.hello.dao;
 
import java.util.List;
import java.util.Map;

import org.hello.domain.BoardVO;
import org.hello.domain.Criteria;
import org.hello.domain.File2VO;
import org.hello.domain.FileVO;

 
public interface BoardDAO {
 
	//�Խñ� �ۼ�
    public void create(BoardVO vo) throws Exception;
    
    //�Խñ� ���� �����ֱ�
    public List<Map<String, Object>> listAll(Criteria cri) throws Exception;
    
    // Ư������� �Խñ� �����ֱ�
    public List<BoardVO> UserAll(String b_writer) throws Exception;    // �׻�� �Խñ۸� ��

    // ���ƿ� �� �����ֱ�
    public List<BoardVO> listLike() throws Exception;
    
    //��ȸ�� �� �����ֱ�
    public List<BoardVO> listSee() throws Exception;
    
    // �Խñ۸��� ���κ����ֱ�
    public List<Map<String, Object>> MusicAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> MovieAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> ActAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> GameAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> FreeAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> RentAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> PerformAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> EventmAll(Criteria cri) throws Exception;
    public List<Map<String, Object>> NoticeAll(Criteria cri) throws Exception;
    
    
    
    // �󼼰Խ���
    public BoardVO boardView(int b_no) throws Exception;
    // �Խñۻ���
    public int delete(int b_no) throws Exception;
    //�Խñ� ����
    public void update(BoardVO vo) throws Exception;
// ��ȸ��
    public void hitPlus(int b_no)throws Exception;
//����÷��
    public int fileInsert(FileVO file) throws Exception;
    //���� �󼼺���
    public FileVO fileDetail(int b_no) throws Exception;
    //���� ����
    public int filedelete(int b_no) throws Exception;
    
    
    public int fileInsert2(File2VO file) throws Exception;
    //���� �󼼺���
    public File2VO fileDetail2(int b_no) throws Exception;
    //���� ����
    public int filedelete2(int b_no) throws Exception;
    
    
    
// ���ƿ�
    public void likePlus(int b_no)throws Exception;
    // ���ƿ� ���
    public void likeminus(int b_no)throws Exception;
    
    // �Խñ� ��ü���� 
   public List<Map<String, Object>> selectBoardList(Criteria cri);
   
   //�Խñ۸��� ���� ����(����¡ ó����)
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
 
