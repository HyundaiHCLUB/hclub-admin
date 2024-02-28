package site.hclub.hyndai.dto;

import lombok.Data;

/**
 * @author 김은솔
 * @description: 공통 DTO 파일을 작성한다.
 * ===========================
	   AUTHOR      NOTE
 * ---------------------------
 *      김은솔       최초생성
 * ===========================
 */
@Data
public class CommonDTO {

	/**
	 시작 index 
	*/
	private String startIndex;
	/**
	 끝 index 
	*/
	private String endIndex;
	/**
	 검색어
	*/
	private String searchParams;
	
	/**
	 ROWNUM
	*/
	private String rn;
}
