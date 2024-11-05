package com.ict.member.dao;

import com.ict.member.vo.MemberVO;

public interface MemberDAO {

	// 로그인
	public MemberVO getMemberLogIn(String m_id) throws Exception;
}
