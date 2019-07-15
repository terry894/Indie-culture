package org.hello.service;
import java.util.List;

import org.hello.domain.BoardVO;
import org.hello.domain.UserVO;


public interface UserService {

	public void createUser(UserVO vo) throws Exception;
	 public UserVO login(UserVO vo) throws Exception;
	 public List<BoardVO> UserInfo() throws Exception;
	 
	public List<BoardVO> OtherInfo() throws Exception;

	    public void updateUser(UserVO vo) throws Exception;
	    public int deleteUser(String a_id) throws Exception;

	    public List<UserVO> listAllUser() throws Exception;

}
