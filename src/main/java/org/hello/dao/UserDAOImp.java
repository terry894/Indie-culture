package org.hello.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.hello.domain.BoardVO;
import org.hello.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository //DAO라고 명시 (DAO를 스프링에서 인식시켜줌)
public class UserDAOImp implements UserDAO {

    @Inject // 의존관계를 자동으로 연결(JAVA에서 제공) ==@autowired (Spring에서 제공)
    private SqlSession sqlSession; 
    
    
    private static final String namespace = "org.hello.mapper.userMapper"; 
                                            //memberMapper.xml의 namespace값
    
    @Override
    public void createUser(UserVO vo)throws Exception {
        sqlSession.insert(namespace+".insertUser", vo);
    }
    
    
    /** 

     *  login에 성공하면, 유저 정보를 담고 있는 UserVO 객체를 반환한다.

     * */

    @Override

    public UserVO login(UserVO vo) {

        // Mapper의 namespace명.id : 자신에게 맞게 작성해서 넣는다.
    	sqlSession.selectOne(namespace+".login", vo);
        return sqlSession.selectOne(namespace+".login", vo);

    }


    
    // 로그인된 정보 보여주기
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
