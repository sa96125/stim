package com.sa96125.user.application.common.exception.custom;

public class DatabaseException extends RuntimeException {
    public DatabaseException(String message) {
        super(message);
    }
}