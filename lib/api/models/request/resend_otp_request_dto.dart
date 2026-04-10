import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_request_dto.g.dart';

@JsonSerializable()
class ResendOtpRequestDto {
  @JsonKey(name: "email")
  final String? email;

  ResendOtpRequestDto ({
    this.email,
  });

  factory ResendOtpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ResendOtpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResendOtpRequestDtoToJson(this);
  }
}


