package site.hclub.hyndai.service;

import java.util.List;

import site.hclub.hyndai.dto.MemberDTO;

/**
 * @author 김은솔
 * @description: 멤버 관련 MemberService를 작성한다.
 * ===========================
	   AUTHOR      NOTE
 * ---------------------------
 *    김은솔          최초 생성
 * ===========================
 */
public interface MemberService {

	/**
	 작성자: 김은솔 
	 처리 내용: 조회 조건을 기준으로 멤버 레이팅 리스트를 조회한다.
	*/
	List<MemberDTO> getRatingRankList(MemberDTO mdto);
}
