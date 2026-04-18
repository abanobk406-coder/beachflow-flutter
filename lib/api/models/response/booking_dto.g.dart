// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDto _$BookingDtoFromJson(Map<String, dynamic> json) => BookingDto(
  id: (json['id'] as num?)?.toInt(),
  beachId: (json['beachId'] as num?)?.toInt(),
  bookingDate: json['bookingDate'] as String?,
  numberOfPersons: (json['numberOfPersons'] as num?)?.toInt(),
  status: json['status'] as String?,
  totalPrice: json['totalPrice'] as num?,
  createdAt: json['createdAt'] as String?,
  beach: json['beach'] == null
      ? null
      : BeachDto.fromJson(json['beach'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookingDtoToJson(BookingDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'beachId': instance.beachId,
      'bookingDate': instance.bookingDate,
      'numberOfPersons': instance.numberOfPersons,
      'status': instance.status,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt,
      'beach': instance.beach,
    };
