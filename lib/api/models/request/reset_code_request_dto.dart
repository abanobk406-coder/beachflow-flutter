import 'package:json_annotation/json_annotation.dart';

part 'reset_code_request_dto.g.dart';

@JsonSerializable()
class ResetCodeRequestDto {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "otp")
  final String? otp;

  ResetCodeRequestDto ({
    this.email,
    this.otp,
  });

  factory ResetCodeRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ResetCodeRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetCodeRequestDtoToJson(this);
  }
}


