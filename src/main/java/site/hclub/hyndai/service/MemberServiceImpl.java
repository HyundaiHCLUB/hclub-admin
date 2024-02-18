package site.hclub.hyndai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.hclub.hyndai.dto.MemberDTO;
import site.hclub.hyndai.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public List<MemberDTO> getRatingRankList(MemberDTO mdto) {
		
		return memberMapper.getRatingRankList(mdto);
	}

}
