import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;

  ResetPasswordResponseDto ({
    this.status,
    this.message,
  });

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordResponseDtoToJson(this);
  }
}


