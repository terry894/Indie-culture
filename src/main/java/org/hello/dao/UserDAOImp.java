package org.hello.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.hello.domain.BoardVO;
import org.hello.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository //DAO��� ��� (DAO�� ���������� �νĽ�����)
public class UserDAOImp implements UserDAO {

    @Inject // �������踦 �ڵ����� ����(JAVA���� ����) ==@autowired (Spring���� ����)
    private SqlSession sqlSession; 
    
    
    private static final String namespace = "org.hello.mapper.userMapper"; 
                                            //memberMapper.xml�� namespace��
    
    @Override
    public void createUser(UserVO vo)throws Exception {
        sqlSession.insert(namespace+".insertUser", vo);
    }
    
    
    /** 

     *  login�� �����ϸ�, ���� ������ ��� �ִ� UserVO ��ü�� ��ȯ�Ѵ�.

     * */

    @Override

    public UserVO login(UserVO vo) {

        // Mapper�� namespace��.id : �ڽſ��� �°� �ۼ��ؼ� �ִ´�.
    	sqlSession.selectOne(namespace+".login", vo);
        return sqlSession.selectOne(namespace+".login", vo);

    }


    
    // �α��ε� ���� �����ֱ�
	@Override
	public List<BoardVO> UserInfo() throws Exception {
		sqlSession.selectList(namespace+".UserInfo");
		return sqlSession.selectList(namespace+".UserInfo");
	}
	
	

	@Override
	public List<BoardVO> OtherInfo() throws Exception {
		sqlSession.selectList(namespace+".OtherInfo");
		return sqlSession.selectList(namespace+".OtherInfo");
	}
	
	
	
	

	@Override
	public void updateUser(UserVO vo) throws Exception {
		 sqlSession.update(namespace+".updateUser", vo);
		
	}


	@Override
	public List<UserVO> listAllUser() throws Exception {
		  sqlSession.selectList(namespace+".UserBoard");
	        return sqlSession.selectList(namespace+".UserBoard"); 
	}


	@Override
	public int deleteUser(String a_id) throws Exception {
		 sqlSession.delete(namespace+".deleteUser", a_id);
	        return  sqlSession.delete(namespace+".deleteUser", a_id);
	}


	


	


	





}
