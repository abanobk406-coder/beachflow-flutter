import 'package:por2/api/models/response/user_dto.dart';
import 'package:por2/domain/entities/response/user.dart';

extension UserMapper on UserDto{
  User toUser(){
    return User(
      id: id,
      name: name,
      email: email,
      password: password,
      profilePic: profilePic,
      role: role,
      otp: otp,
      isVerified: isVerified,
      createdAt: createdAt,
      updatedAt: updatedAt
    );
  }
}