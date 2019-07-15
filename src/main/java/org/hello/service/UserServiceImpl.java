package org.hello.service;

import java.util.List;

import javax.inject.Inject;
 
import org.hello.dao.UserDAO;
import org.hello.domain.BoardVO;
import org.hello.domain.UserVO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	@Inject
    private UserDAO dao;
    
    
    @Override
    public void createUser(UserVO vo) throws Exception {
        dao.createUser(vo);
 
    }

    @Override

    public UserVO login(UserVO vo) throws Exception {

        return dao.login(vo);

    }

	@Override
	public List<BoardVO> UserInfo() throws Exception {
	
		return dao.UserInfo();
	}

	@Override
	public List<BoardVO> OtherInfo() throws Exception {
		// TODO Auto-generated method stub
		return dao.OtherInfo();
	}
	
	@Override
	public void updateUser(UserVO vo) throws Exception {
	dao.updateUser(vo);
		
	}

	@Override
	public List<UserVO> listAllUser() throws Exception {
		return dao.listAllUser();
	}

	@Override
	public int deleteUser(String a_id) throws Exception {
		
		return dao.deleteUser(a_id);
	}

	

	

   

}
