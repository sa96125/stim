package com.sa96125.user.application.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.UUID;

public interface UserService {
    User create(User user);

    Page<User> findByAll(Pageable pageable);

    User update(User user);

    void delete(UUID userId);

    User getById(UUID userId);
}
