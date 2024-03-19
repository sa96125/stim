package com.sa96125.user.application.service;

import com.sa96125.user.adapter.mapstruct.UserMapper;
import com.sa96125.user.application.common.exception.custom.DatabaseException;
import com.sa96125.user.application.common.exception.custom.UserNotFoundException;
import com.sa96125.user.application.repository.UserEntity;
import com.sa96125.user.application.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;
    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository, UserMapper userMapper) {
        this.userMapper = userMapper;
        this.userRepository = userRepository;
    }

    @Override
    public User create(User user) {

        try {
            // given
            UserEntity userEntity = userMapper.toEntity(user);
            // when
            UserEntity savedUserEntity = userRepository.save(userEntity);
            // then
            return userMapper.toUser(savedUserEntity); // UserEntity -> User 변환

        } catch (Exception e) {
            // except
            log.error("Error occurred while creating user: {}", e.getMessage());
            throw new DatabaseException("Error occurred while creating user");
        }
    }

    @Override
    public Page<User> findByAll(Pageable pageable) {
        try {
            // when
            Page<UserEntity> userEntityPage = userRepository.findAll(pageable);
            // then
            return userEntityPage.map(userMapper::toUser);

        } catch (Exception e) {
            // except
            log.error("Error occurred while retrieving all users: {}", e.getMessage());
            throw new DatabaseException("Error occurred while retrieving all users");
        }
    }

    @Override
    public User update(User newUser) {
        try {
            return userRepository.findById(newUser.getId())
                    .map(userMapper::toUser)
                    //.map((user) -> userMapper.updateUser(user, newUser))
                    .map(userMapper::toEntity)
                    .map(userRepository::save)
                    .map(userMapper::toUser)
                    .orElseThrow(() -> new UserNotFoundException("User not found with ID: " + newUser.getId()));

        } catch (Exception e) {
            log.error("Error occurred while updating user: {}", e.getMessage());
            throw new DatabaseException("Error occurred while updating user");
        }
    }

    @Override
    public void delete(UUID userId) {
        try {
            // when
            userRepository.deleteById(userId);

        } catch (Exception e) {
            // except
            log.error("Error occurred while deleting user by username: {}", e.getMessage());
            throw new DatabaseException("Error occurred while deleting user by username");
        }
    }

    @Override
    public User getById(UUID userId) {
        try {
            // when
            UserEntity userEntity = userRepository.findById(userId)
                    .orElseThrow(() -> new UserNotFoundException("User not found with ID: " + userId));
            // then
            return userMapper.toUser(userEntity);

        } catch (Exception e) {
            // except
            log.error("Error occurred while fetching user by ID: {}", e.getMessage());
            throw new DatabaseException("Error occurred while fetching user by ID");
        }
    }
}
