package com.sa96125.user.application.common.exception.custom;

public class AuthenticationServiceException extends RuntimeException {
    public AuthenticationServiceException(String message) {
        super(message);
    }
}