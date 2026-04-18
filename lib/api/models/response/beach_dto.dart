import 'package:json_annotation/json_annotation.dart';
import 'package:por2/domain/entities/response/beach.dart';

part 'beach_dto.g.dart';

@JsonSerializable()
class BeachDto {
  final int? id;
  final String? name;
  final String? location;
  final int? price;
  final String? imageUrl;
  final String? description;
  final int? adminId;
  final int? maxCapacity;
  final num? rating;
  final bool? hasChairs;
  final int? chairPrice;
  final bool? hasUmbrellas;
  final int? umbrellaPrice;
  final String? createdAt;
  final String? updatedAt;
  final int? baseCapacity;

  BeachDto({
    this.id,
    this.name,
    this.location,
    this.price,
    this.imageUrl,
    this.description,
    this.adminId,
    this.maxCapacity,
    this.rating,
    this.hasChairs,
    this.chairPrice,
    this.hasUmbrellas,
    this.umbrellaPrice,
    this.createdAt,
    this.updatedAt,
    this.baseCapacity,
  });

  factory BeachDto.fromJson(Map<String, dynamic> json) =>
      _$BeachDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BeachDtoToJson(this);

  Beach toBeach() {
    return Beach(
      id: id?.toString() ?? '',
      name: name ?? '',
      location: location ?? '',
      price: price ?? 0,
      imageUrl: imageUrl ?? '',
      description: description ?? '',
      rating: rating?.toDouble() ?? 0.0,
    );
  }
}
