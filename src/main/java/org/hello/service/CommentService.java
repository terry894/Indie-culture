package org.hello.service;

import java.util.List;

import org.hello.domain.CommentVO;

public interface CommentService {

 public void createComment(CommentVO vo) throws Exception;
	 
	 public List<CommentVO> CommentAll(int b_no) throws Exception;
	 
	  public void updateComment(CommentVO vo) throws Exception;
	    public int deleteComment(int b_no) throws Exception;
}
