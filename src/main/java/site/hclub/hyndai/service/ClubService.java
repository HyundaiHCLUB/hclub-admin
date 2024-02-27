package site.hclub.hyndai.service;
import java.util.List;

import site.hclub.hyndai.domain.ClubVO;
import site.hclub.hyndai.dto.ClubDTO;

/**
 * @author 김은솔
 * @description: 동아리 관련 서비스를 작성한다.
 * ===========================
	   AUTHOR      NOTE
 * ---------------------------
 *     김은솔       최초 생성  
 * ===========================
 */
public interface ClubService {


	/**
	 작성자: 김은솔 
	 처리 내용: 조회 조건을 기준으로 동아리 리스트를 조회한다.
	*/
	List<ClubDTO> getClubList(ClubVO cvo);
	/**
	 작성자: 김은솔 
	 처리 내용: 조회 조건을 기준으로 동아리 갯수를 조회한다.
	*/
	int getClubCnt(ClubVO cvo);
	/**
	 작성자: 김은솔 
	 처리 내용: 삭제 조건을 기준으로 동아리를 삭제한다.
	*/
	int deleteClubInfo(String clubNo);
	/**
	 작성자: 김은솔 
	 처리 내용: 동아리 승인여부를 업데이트 한다.
	*/
	int updateClubUseYn(String clubNo);
}
