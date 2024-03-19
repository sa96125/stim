package com.sa96125.user.adapter.mapstruct;


import com.sa96125.user.application.controller.in.CreateParams;
import com.sa96125.user.application.controller.in.UpdateParams;
import com.sa96125.user.application.controller.out.UserDetails;
import com.sa96125.user.application.repository.UserEntity;
import com.sa96125.user.application.service.User;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface UserMapper {
    User toUser(CreateParams params);

    User toUser(UpdateParams params);

    User toUser(UserEntity userEntity);

    UserEntity toEntity(User user);

    UserDetails toClient(User user);

//    @AfterMapping
//    default User updateUser(@MappingTarget User target, User source) {
//        return target.toBuilder()
//                .role(source.getRole())
//                .status(source.getStatus())
//                .name(source.getName())
//                .nickName(source.getNickName())
//                .description(source.getDescription())
//                .profileImageUrl(source.getProfileImageUrl())
//                .phoneNumber(source.getPhoneNumber())
//                .birthdate(source.getBirthdate()).build();
//    }
//
//    default User resetPassword(@MappingTarget User target, String hashedPassword) {
//        return target.toBuilder()
//                .password(hashedPassword)
//                .build();
//    }
}
