package site.hclub.hyndai.common.response;
import org.springframework.http.HttpStatus;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public enum SuccessType {
    /**
     * 200 Ok
     */
	GET_CLUB_LIST_SUCCESS(HttpStatus.OK, "동아리 리스트 조회 성공"),
	GET_CLUB_LIST_CNT_SUCCESS(HttpStatus.OK, "동아리 리스트 총 숫자 조회 성공"),
	DELETE_CLUB_INFO_SUCCESS(HttpStatus.OK, "동아리 정보 삭제 성공"),
	UPDATE_CLUB_USE_YN_SUCCESS(HttpStatus.OK, "동아리 정보 승인 성공")
	
    /**
     * 201 Created
     */

    ;
    private final HttpStatus httpStatus;
    private final String message;

    public int getHttpStatusCode() {
        return httpStatus.value();
    }
}
