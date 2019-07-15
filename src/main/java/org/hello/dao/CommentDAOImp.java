package org.hello.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.hello.domain.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class CommentDAOImp implements CommentDAO{
	
	
	@Autowired
	 private SqlSession sqlSession; 
	    
	 private static final String namespace = "org.hello.mapper.commentMapper"; 

	@Override
	public void createComment(CommentVO vo) throws Exception {
		sqlSession.insert(namespace+".insertComment", vo);
	
	}

	@Override
	public List<CommentVO> CommentAll(int b_no) throws Exception {
		 sqlSession.selectList(namespace+".listComment",b_no);
	        return sqlSession.selectList(namespace+".listComment",b_no); 
	}

	@Override
	public void updateComment(CommentVO vo) throws Exception {
		sqlSession.update(namespace+".updateComment", vo);
		
	}

	@Override
	public int deleteComment(int b_no) throws Exception {
		 sqlSession.delete(namespace+".deleteComment", b_no);
	        return  sqlSession.delete(namespace+".deleteComment", b_no);
	}

}
