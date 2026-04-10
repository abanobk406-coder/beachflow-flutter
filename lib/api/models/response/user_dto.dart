import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';
@JsonSerializable()
class UserDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "otp")
  final dynamic? otp;
  @JsonKey(name: "profilePic")
  final String? profilePic;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  UserDto ({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.otp,
    this.profilePic,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }
}