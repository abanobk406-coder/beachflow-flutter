import 'package:json_annotation/json_annotation.dart';

part 'reset_code_response_dto.g.dart';

@JsonSerializable()
class ResetCodeResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;

  ResetCodeResponseDto ({
    this.status,
    this.message,
  });

  factory ResetCodeResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ResetCodeResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetCodeResponseDtoToJson(this);
  }
}


