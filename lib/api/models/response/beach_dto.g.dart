// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeachDto _$BeachDtoFromJson(Map<String, dynamic> json) => BeachDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  location: json['location'] as String?,
  price: (json['price'] as num?)?.toInt(),
  imageUrl: json['imageUrl'] as String?,
  description: json['description'] as String?,
  adminId: (json['adminId'] as num?)?.toInt(),
  maxCapacity: (json['maxCapacity'] as num?)?.toInt(),
  rating: json['rating'] as num?,
  hasChairs: json['hasChairs'] as bool?,
  chairPrice: (json['chairPrice'] as num?)?.toInt(),
  hasUmbrellas: json['hasUmbrellas'] as bool?,
  umbrellaPrice: (json['umbrellaPrice'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  baseCapacity: (json['baseCapacity'] as num?)?.toInt(),
);

Map<String, dynamic> _$BeachDtoToJson(BeachDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'location': instance.location,
  'price': instance.price,
  'imageUrl': instance.imageUrl,
  'description': instance.description,
  'adminId': instance.adminId,
  'maxCapacity': instance.maxCapacity,
  'rating': instance.rating,
  'hasChairs': instance.hasChairs,
  'chairPrice': instance.chairPrice,
  'hasUmbrellas': instance.hasUmbrellas,
  'umbrellaPrice': instance.umbrellaPrice,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'baseCapacity': instance.baseCapacity,
};
