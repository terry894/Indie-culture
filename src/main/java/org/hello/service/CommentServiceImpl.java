package org.hello.service;

import java.util.List;


import org.hello.dao.CommentDAO;
import org.hello.domain.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{
	 @Autowired
	    private CommentDAO dao;

	@Override
	public void createComment(CommentVO vo) throws Exception {
		dao.createComment(vo);
		
	}

	@Override
	public List<CommentVO> CommentAll(int b_no) throws Exception {
		return dao.CommentAll(b_no);
	}

	@Override
	public void updateComment(CommentVO vo) throws Exception {
		dao.updateComment(vo);
		
	}

	@Override
	public int deleteComment(int b_no) throws Exception {
	return dao.deleteComment(b_no);
	}

}
