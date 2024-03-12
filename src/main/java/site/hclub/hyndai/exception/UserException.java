package site.hclub.hyndai.exception;

import site.hclub.hyndai.common.advice.BusinessException;
import site.hclub.hyndai.common.advice.BusinessExceptionType;
/**
 * @author 김동욱
 * @description: 사용자 Exception Class
 * ===========================
AUTHOR      NOTE
 * ---------------------------
 *    김동욱        최초생성
 * ===========================
 */
public class UserException extends BusinessException {
    public UserException(BusinessExceptionType exceptionType) {
        super(exceptionType);
    }
}
