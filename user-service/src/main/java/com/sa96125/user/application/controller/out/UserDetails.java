package com.sa96125.user.application.controller.out;

import java.util.UUID;

public record UserDetails(
        UUID id,
        String email
) {
}
