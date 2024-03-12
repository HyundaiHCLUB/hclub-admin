package site.hclub.hyndai.exception;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import site.hclub.hyndai.common.advice.BusinessExceptionType;
/**
 * @author 김동욱
 * @description: 사용자 Exception 타입 선언
 * ===========================
AUTHOR      NOTE
 * ---------------------------
 *    김동욱        최초생성
 * ===========================
 */
@Getter
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public enum UserExceptionType implements BusinessExceptionType {

    NO_TOKEN_EXCEPTION(HttpStatus.BAD_REQUEST, "토큰을 resolve 하는 과정에서 발생"),

    ;

    private final HttpStatus status;
    private final String message;

    @Override
    public HttpStatus status() {
        return this.status;
    }

    @Override
    public String message() {
        return this.message;
    }
}
