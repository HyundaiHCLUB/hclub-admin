package site.hclub.hyndai.dto;

import lombok.Data;

/**
 * @author 김은솔
 * @description: 멤버정보 관련 MemberDTO를 작성한다.
 * ===========================
	   AUTHOR      NOTE
 * ---------------------------
 *     김은솔       최초생성
 * ===========================
 */
@Data
public class MemberDTO {
	/**
    멤버 번호 
   */
   private Long memberNo;
   /**
    멤버 아이디
   */
   private String memberId;
   /**
    멤버 사진
   */
   private String memberImage;
   /**
    관심사
   */
   private String memberInterest;
   /**
    레이팅
   */
   private Long memberRating ;
   /**
    사원 번호
   */
   private String employeeNo;
   /**
    회원 비밀번호
   */
   private String memberPw;
   /**
    관리자여부
    */
   private String adminYn ;
   /**
    매치 횟수
   */
   private String matchNum;
   /**
    열 수
   */
   private String ROWNUM;
   /**
    사원 이름
   */
   private String employeeName;

}
