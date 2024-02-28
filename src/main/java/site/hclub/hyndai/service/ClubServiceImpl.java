package site.hclub.hyndai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.hclub.hyndai.domain.ClubVO;
import site.hclub.hyndai.dto.ClubDTO;
import site.hclub.hyndai.dto.MemberDTO;
import site.hclub.hyndai.mapper.ClubMapper;

@Service
public class ClubServiceImpl implements ClubService {

	@Autowired
	private ClubMapper clubMapper;
	
	@Override
	public List<ClubDTO> getClubList(ClubVO cvo) {
	
		return clubMapper.getClubList(cvo);
	}
	@Override
	public int getClubCnt(ClubVO cvo) {
		
		return clubMapper.getClubCnt(cvo);
	}
	@Override
	public int deleteClubInfo(String clubNo) {
		return clubMapper.deleteClubInfo(clubNo);
	}
	@Override
	public int updateClubUseYn(String clubNo) {
		
		return clubMapper.updateClubUseYn(clubNo);
	}
	

}
