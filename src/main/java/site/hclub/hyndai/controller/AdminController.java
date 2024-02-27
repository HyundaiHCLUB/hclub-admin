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
	
	 @PostMapping("/club")
	 public ResponseEntity<ApiResponse<List<ClubDTO>>> getClubList(@RequestBody ClubVO cvo) {
		 
		 return ApiResponse.success(GET_CLUB_LIST_SUCCESS, clubService.getClubList(cvo));
	 }
	 @PostMapping("/clubCnt")
	 public ResponseEntity<ApiResponse<Integer>> getClubCnt(@RequestBody ClubVO cvo) {
		 
		 return ApiResponse.success(GET_CLUB_LIST_CNT_SUCCESS, clubService.getClubCnt(cvo));
	 }
	 @DeleteMapping("/club")
	 public ResponseEntity<ApiResponse<Integer>> deleteClubInfo(@RequestBody List<String> clubNoList) {
		 int result = -1;
		 
		 for(String clubNo: clubNoList) {
			 result=  clubService.deleteClubInfo(clubNo);
		 }
		 
		 return ApiResponse.success(DELETE_CLUB_INFO_SUCCESS, result);
	 }
	 @GetMapping("/club/updateUseYn/{clubNo}")
	 public ResponseEntity<ApiResponse<Integer>> updateClubUseYn(@PathVariable String clubNo) {
		 
		 return ApiResponse.success(UPDATE_CLUB_USE_YN_SUCCESS, clubService.updateClubUseYn(clubNo));
	 }
	 @PostMapping("/rank")
	 public ResponseEntity<ApiResponse<List<MemberDTO>>> getRatingRankList(@RequestBody MemberDTO mdto) {
		 
		 return ApiResponse.success(GET_MEMBER_LIST_SUCCESS, MemberService.getRatingRankList(mdto));
	
	 }
	 @GetMapping("/clubAdminPage")
	 public ModelAndView clubAdminPage() {
		   ModelAndView mv  = new ModelAndView();
		   mv.setViewName("admin/clubAdminPage");
		   
		  return mv;
	 }
	 @GetMapping("/rankAdminPage")
	 public ModelAndView rankAdminPage() {
		   ModelAndView mv  = new ModelAndView();
		   mv.setViewName("admin/rankAdminPage");
		   
		  return mv;
	 }
	 @GetMapping("/loginPage")
	 public ModelAndView loginPage() {
		   ModelAndView mv  = new ModelAndView();
		   mv.setViewName("admin/loginPage");
		   
		  return mv;
	 }
	 //comp용 코드 추후에 삭제 예정
	@RequestMapping("/kakaopay")
	public String kakaopay(HttpSession session) {			
	try {
				
		URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			
		HttpURLConnection connection = (HttpURLConnection) address.openConnection(); 
		connection.setRequestMethod("POST");
		//connection.setRequestProperty("Authorization", "KakaoAK 8d0ba42fb4ca1001d7004e52945fc844");
		connection.setRequestProperty("Authorization", "KakaoAK 0b1efc751d51b0b323a23113a2f11104");
		connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		connection.setDoOutput(true);
							
		String parameter = "cid=TC0ONETIME" // 가맹점 코드
				+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
				+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
				+ "&item_name=rice" // 상품명
				+ "&quantity=1" // 상품 수량
				+ "&total_amount="+2000 // 총 금액
				+ "&vat_amount=200" // 부가세
				+ "&tax_free_amount=0" // 상품 비과세 금액
				+ "&approval_url=http://localhost" // 결제 성공 시
				+ "&fail_url=http://localhost" // 결제 실패 시
				+ "&cancel_url=http://localhost";
			
		OutputStream out = connection.getOutputStream();	
		DataOutputStream data =new DataOutputStream(out);
		data.writeBytes(parameter);
				
		data.close();			
						
		int  result = connection.getResponseCode();
				
		InputStream in;
		if(result ==200) {
			in = connection.getInputStream();
			System.out.println("ajax 통신성공");
		}
		else {
			in = connection.getErrorStream();
			System.out.println("ajax 통신실패");
		}
		System.out.println("result값은 "+result);
				
		InputStreamReader inRead = new InputStreamReader(in); 
		BufferedReader change = new BufferedReader(inRead);
		System.out.println(parameter);
		
		
			return change.readLine();
		} catch (MalformedURLException e) {
				
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
					}	
			return "";
		}
}
