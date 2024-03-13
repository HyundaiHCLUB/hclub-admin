package site.hclub.hyndai.controller;
import static site.hclub.hyndai.common.response.SuccessType.*;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import site.hclub.hyndai.service.MemberService;
import lombok.extern.log4j.Log4j;
import site.hclub.hyndai.common.response.ApiResponse;
import site.hclub.hyndai.domain.ClubVO;
import site.hclub.hyndai.dto.ClubDTO;
import site.hclub.hyndai.dto.MemberDTO;
import site.hclub.hyndai.service.ClubService;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author 김은솔
 * @description: 관리자 관련 Contoller를 작성한다.
 * ===========================
	   AUTHOR      NOTE
 * ---------------------------
 *    김은솔         최초생성
 * ===========================
 */
@RestController
@RequestMapping("/admin")
@Log4j
public class AdminController {

	@Autowired
	private ClubService clubService;
	
	@Autowired
	private MemberService MemberService;
	
	/**
     * @author : 김은솔
     * @description :동아리 리스트 조회 API
     * @request  : 동아리 VO (ClubVO)
     * @response : 동아리 정보 
     *
     */
	 @PostMapping("/club")
	 public ResponseEntity<ApiResponse<List<ClubDTO>>> getClubList(@RequestBody ClubVO cvo) {
		 
		 return ApiResponse.success(GET_CLUB_LIST_SUCCESS, clubService.getClubList(cvo));
	 }
	 /**
	  * @author : 김은솔
	   * @description :동아리 리스트 수 조회 API
	   * @request  : 동아리 VO (ClubVO)
	   * @response : 동아리 정보 수
	   *
	  */
	 @PostMapping("/clubCnt")
	 public ResponseEntity<ApiResponse<Integer>> getClubCnt(@RequestBody ClubVO cvo) {
		 
		 return ApiResponse.success(GET_CLUB_LIST_CNT_SUCCESS, clubService.getClubCnt(cvo));
	 }
	 /**
	  * @author : 김은솔
	   * @description :동아리 리스트 삭제 API
	   * @request  : 삭제 List clubNoList
	   * @response : 
	   *
	  */
	 @DeleteMapping("/club")
	 public ResponseEntity<ApiResponse<Integer>> deleteClubInfo(@RequestBody List<String> clubNoList) {
		 int result = -1;
		 
		 for(String clubNo: clubNoList) {
			 result=  clubService.deleteClubInfo(clubNo);
		 }
		 
		 return ApiResponse.success(DELETE_CLUB_INFO_SUCCESS, result);
	 }
	 /**
	  * @author : 김은솔
	   * @description :동아리 승인 API
	   * @request  : 동아리 번호 clubNo
	   * @response : 
	   *
	  */
	 @GetMapping("/club/updateUseYn/{clubNo}")
	 public ResponseEntity<ApiResponse<Integer>> updateClubUseYn(@PathVariable String clubNo) {
		 
		 return ApiResponse.success(UPDATE_CLUB_USE_YN_SUCCESS, clubService.updateClubUseYn(clubNo));
	 }
	 /**
	  * @author : 김은솔
	   * @description :개인 랭킹 조회 API
	   * @request  : 멤버정보 MemberDTO
	   * @response : 멤버 리스트 
	   *
	 */
	 @PostMapping("/rank")
	 public ResponseEntity<ApiResponse<List<MemberDTO>>> getRatingRankList(@RequestBody MemberDTO mdto) {
		 
		 return ApiResponse.success(GET_MEMBER_LIST_SUCCESS, MemberService.getRatingRankList(mdto));
	
	 }
	 /**
	  * @author : 김은솔
	   * @description :개인 랭킹 수 조회 API
	   * @request  : 멤버정보 MemberDTO
	   * @response : 멤버 리스트 수
	   *
	 */
	 @PostMapping("/rankCnt")
	 public ResponseEntity<ApiResponse<Integer>> getMemberCnt(@RequestBody MemberDTO mdto) {
		 
		 return ApiResponse.success(GET_CLUB_LIST_CNT_SUCCESS, MemberService.getMemberCnt(mdto));
	 }
	 
}
