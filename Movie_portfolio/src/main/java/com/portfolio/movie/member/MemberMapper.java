package com.portfolio.movie.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	public int join(MemberVO mvo);
	public MemberVO login(MemberVO mvo);
	public int chkId(String cid);
}
