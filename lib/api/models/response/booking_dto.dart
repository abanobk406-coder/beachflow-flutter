import 'package:json_annotation/json_annotation.dart';
import 'package:por2/api/models/response/beach_dto.dart';
import 'package:por2/domain/entities/response/booking_entity.dart';

part 'booking_dto.g.dart';

@JsonSerializable()
class BookingDto {
  final int? id;
  final int? beachId;
  final String? bookingDate;
  final int? numberOfPersons;
  final String? status;
  final num? totalPrice;
  final String? createdAt;
  final BeachDto? beach;

  BookingDto({
    this.id,
    this.beachId,
    this.bookingDate,
    this.numberOfPersons,
    this.status,
    this.totalPrice,
    this.createdAt,
    this.beach,
  });

  factory BookingDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDtoToJson(this);

  BookingEntity toEntity() {
    return BookingEntity(
      id: id?.toString() ?? '',
      beachName: beach?.name ?? 'شاطئ غير معروف',
      beachLocation: beach?.location ?? '',
      beachImageUrl: beach?.imageUrl ?? '',
      bookingDate: bookingDate ?? '',
      numberOfPersons: numberOfPersons ?? 0,
      status: status ?? 'غير محدد',
      totalPrice: totalPrice?.toDouble() ?? 0.0,
    );
  }
}
