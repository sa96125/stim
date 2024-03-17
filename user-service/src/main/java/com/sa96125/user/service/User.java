package com.sa96125.user.service;

import lombok.Builder;
import lombok.Getter;
import lombok.Value;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Value
@Getter
@Builder(toBuilder = true)
public class User {
    UUID id;
 //   OAuthProvider oAuthProvider;
    String email;
    String password;
    String role;
    // activate,
    String status;
    String name;
    String nickName;
    String description;
    String profileImageUrl;
    String phoneNumber;
    LocalDate birthdate;
    LocalDateTime lastLoginAt;
}