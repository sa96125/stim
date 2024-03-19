package com.sa96125.user.application.controller.in;

import java.time.LocalDate;

public record UpdateParams(
        String email,
        String password,
        String role,
        String name,
        String nickName,
        String description,
        String profileImageUrl,
        String phoneNumber,
        LocalDate birthdate
) {
}
