package site.hclub.hyndai.domain;

import lombok.Data;

/**
 * @author 김은솔
 * @description: 동아리 관련 DTO파일을 작성한다.
 * ===========================
	   AUTHOR      NOTE
 * ---------------------------
 *     김은솔        최초생성
 * ===========================
 */
@Data
public class ClubVO {

	/**
	 동아리 번호
	 */
	private long clubNo;
	/**
	 동아리 이름
	 */
	private String clubName;
	/**
	 동아리 사진
	 */
	private String clubImage;
	/**
	 동아리 소개
	 */
	private String clubInfo;
	/**
	 활동 지역
	 */
	private String clubLoc;
	/**
	 생성 날짜
	 */
	private String createdAt;
	/**
	 수정 날짜
	 */
	private String modifiedAt;
	/**
	 활성 여부
	 */
	private String useYn;
	/**
	 카테고리 아이디
	 */
	private String categoryId;
}
