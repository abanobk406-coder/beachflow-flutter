import 'package:por2/domain/entities/response/booking_entity.dart';

abstract class BookingsRepository {
  Future<List<BookingEntity>> getMyBookings(String token);
}
