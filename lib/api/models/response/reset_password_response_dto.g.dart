// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseDto _$ResetPasswordResponseDtoFromJson(
  Map<String, dynamic> json,
) => ResetPasswordResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$ResetPasswordResponseDtoToJson(
  ResetPasswordResponseDto instance,
) => <String, dynamic>{'status': instance.status, 'message': instance.message};
