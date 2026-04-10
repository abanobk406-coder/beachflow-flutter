// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_code_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetCodeRequestDto _$ResetCodeRequestDtoFromJson(Map<String, dynamic> json) =>
    ResetCodeRequestDto(
      email: json['email'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$ResetCodeRequestDtoToJson(
  ResetCodeRequestDto instance,
) => <String, dynamic>{'email': instance.email, 'otp': instance.otp};
