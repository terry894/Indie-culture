package org.hello.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.hello.domain.MemberVO;
import org.springframework.stereotype.Repository;

@Repository //DAO��� ��� (DAO�� ���������� �νĽ�����)
public class MemberDAOImp implements MemberDAO {

    @Inject // �������踦 �ڵ����� ����(JAVA���� ����) ==@autowired (Spring���� ����)
    private SqlSession sqlSession; 
    
    
    private static final String namespace = "org.hello.mapper.MemberMapper"; 
                                            //memberMapper.xml�� namespace��
    
    @Override
    public void insertMember(MemberVO vo) {
        sqlSession.insert(namespace+".insertMember", vo);
    }
    
}
