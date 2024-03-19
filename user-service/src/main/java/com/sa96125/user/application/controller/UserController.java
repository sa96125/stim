package com.sa96125.user.application.controller;

import com.sa96125.user.adapter.mapstruct.UserMapper;
import com.sa96125.user.application.controller.in.CreateParams;
import com.sa96125.user.application.controller.in.UpdateParams;
import com.sa96125.user.application.controller.out.UserDetails;
import com.sa96125.user.application.service.User;
import com.sa96125.user.application.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/users")
public class UserController {

    private final UserMapper userMapper;
    private final UserService userService;

    @Autowired
    public UserController(UserMapper userMapper, UserService userService) {
        this.userMapper = userMapper;
        this.userService = userService;
    }

    @PostMapping("/")
    public ResponseEntity<UserDetails> register(@RequestBody @Valid CreateParams params) {
        // given
        User newUser = userMapper.toUser(params);

        // when
        User user = userService.create(newUser);

        // then
        UserDetails response = userMapper.toClient(user);
        return ResponseEntity.ok().body(response);
    }

    @GetMapping("/")
    public ResponseEntity<Page<UserDetails>> getUsers(@RequestParam(defaultValue = "0") int page,
                                                      @RequestParam(defaultValue = "10") int size) {
        // given
        Pageable pageable = PageRequest.of(page, size);

        // when
        Page<User> usersPage = userService.findByAll(pageable);

        // then
        Page<UserDetails> userDetailsPage = usersPage.map(userMapper::toClient);
        return ResponseEntity.ok().body(userDetailsPage);
    }

    @PutMapping("/")
    public ResponseEntity<UserDetails> edit(@RequestBody @Valid UpdateParams params) {
        // given
        User user = userMapper.toUser(params);

        // when
        User updatedUser = userService.update(user);

        // then
        UserDetails userDetails = userMapper.toClient(updatedUser);

        return ResponseEntity.ok().body(userDetails);
    }

    @DeleteMapping("/{userId}")
    public ResponseEntity<Void> withdrawal(@PathVariable UUID userId) {
        // when
        userService.delete(userId);

        // then
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{userId}")
    public ResponseEntity<UserDetails> detail(@PathVariable UUID userId) {
        // when
        User user = userService.getById(userId);

        // then
        UserDetails userDetails = userMapper.toClient(user);
        return ResponseEntity.ok().body(userDetails);
    }
}