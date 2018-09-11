package com.xueqing.demo.springbootsecurity.exception;

/**
 * Created by fanyuli on 2018/5/14.
 */
public class AuthException extends Exception{
    private String msg;
    public AuthException(String msg) {
        super(msg);
        this.msg = msg;
    }
}
