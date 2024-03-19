package com.sa96125.user.application.common.exception.custom;

public class PasswordResetException extends RuntimeException {
    public PasswordResetException(String message) {
        super(message);
    }
}