package com.sa96125.user.application.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;
import java.util.UUID;

public interface UserRepository {
    UserEntity save(UserEntity userEntity);

    Page<UserEntity> findAll(Pageable pageable);

    void deleteById(UUID userId);

    Optional<UserEntity> findById(UUID userId);

    Optional<UserEntity> findByEmail(String email);

    boolean existsByEmail(String email);

    boolean existsByUserId(UUID userId);
}
