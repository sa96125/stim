package com.sa96125.user.application.common.exception.custom;

public class UserNotActivatedException extends RuntimeException {
    public UserNotActivatedException(String message) {
        super(message);
    }
}