import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_response_dto.g.dart';

@JsonSerializable()
class ResendOtpResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;

  ResendOtpResponseDto ({
    this.status,
    this.message,
  });

  factory ResendOtpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ResendOtpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResendOtpResponseDtoToJson(this);
  }
}


