package com.sa96125.user.application.common.exception;

import com.sa96125.user.application.common.exception.custom.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Map<String, String>> handleValidationException(MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach(error -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });
        return ResponseEntity.badRequest().body(errors);
    }

    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<String> handleUserNotFoundException(UserNotFoundException ex) {
        log.error("User not found exception: {}", ex.getMessage());
        return ResponseEntity.notFound().build();
    }

    @ExceptionHandler(UserAlreadyExistsException.class)
    public ResponseEntity<String> handleUserAlreadyExistsException(UserAlreadyExistsException ex) {
        log.error("User already exists exception: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.CONFLICT).body("User already exists");
    }

    @ExceptionHandler(UserNotActivatedException.class)
    public ResponseEntity<String> handleUserNotActivatedException(UserNotActivatedException ex) {
        log.error("User not activated exception: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body("User not activated");
    }

    @ExceptionHandler(PasswordResetException.class)
    public ResponseEntity<String> handlePasswordResetException(PasswordResetException ex) {
        log.error("Password reset exception: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Password reset error");
    }

    @ExceptionHandler(DatabaseException.class)
    public ResponseEntity<String> handleDatabaseException(DatabaseException ex) {
        log.error("Database exception: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Database error");
    }

    @ExceptionHandler(AuthenticationServiceException.class)
    public ResponseEntity<String> handleAuthenticationServiceException(AuthenticationServiceException ex) {
        log.error("Authentication service exception: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Authentication failed");
    }
}
