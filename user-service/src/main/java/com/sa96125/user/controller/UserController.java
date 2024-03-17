package com.sa96125.user.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/users")
public class UserController {
    
//    @PostMapping("/")
//    public ResponseEntity<UserDetails> register(@RequestBody @Valid CreateParams params) {
//
//        return ResponseEntity.ok().body();
//    }
//
//    @GetMapping("/")
//    public ResponseEntity<Page<UserDetails>> getUsers(@RequestParam(defaultValue = "0") int page,
//                                                      @RequestParam(defaultValue = "10") int size) {
//
//        return ResponseEntity.ok().body();
//    }
//
//    @PutMapping("/")
//    public ResponseEntity<UserDetails> edit(@RequestBody @Valid UpdateParams params) {
//        return ResponseEntity.ok().body();
//    }
//
//    @DeleteMapping("/")
//    public ResponseEntity<Void> withdrawal(UUID userId) {
//        return ResponseEntity.noContent().build();
//    }
//
//    @GetMapping("/{userId}")
//    public ResponseEntity<UserDetails> detail(@PathVariable UUID userId) {
//        return ResponseEntity.ok().body();
//    }
//
}