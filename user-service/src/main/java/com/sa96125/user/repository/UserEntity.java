package com.sa96125.user.repository;

import jakarta.persistence.*;
import org.hibernate.annotations.GenericGenerator;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
public class UserEntity {
    
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(columnDefinition = "BINARY(16)")
    private UUID id;
    
    @Column(nullable = false, unique = true)
    private String email;
    
    @Column(nullable = false)
    private String password;
    
    @Column(nullable = false)
    // @Enumerated(EnumType.STRING)
    private String role;
    
    @Column(nullable = false)
    // @Enumerated(EnumType.STRING)
    private String status;
    
    @Column
    private String name;
    
    @Column
    private String nickName;
    
    @Column
    private String description;
    
    @Column
    private String profileImageUrl;
    
    @Column
    private String phoneNumber;
    
    @Column
    private LocalDate birthdate;
    
    @Column
    private LocalDateTime lastLoginAt;
}
