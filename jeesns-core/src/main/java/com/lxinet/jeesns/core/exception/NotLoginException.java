package com.lxinet.jeesns.core.exception;

/**
 * 未登录异常
 * 2017年12月6日11:42:07
 * 黄天浩
 */
public class NotLoginException extends Exception {

    public NotLoginException(){
        super("请先登录");
    }
}
