package com.sa96125.user.application.service;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Getter
@Setter
@Builder(toBuilder = true)
@NoArgsConstructor
@AllArgsConstructor
public class User {
    UUID id;
    String email;
    String password;
    String role;
    String status;
    String name;
    String nickName;
    String description;
    String profileImageUrl;
    String phoneNumber;
    LocalDate birthdate;
    LocalDateTime lastLoginAt;
}