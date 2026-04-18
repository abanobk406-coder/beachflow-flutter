import 'package:por2/api/models/response/booking_dto.dart';

abstract class BookingsRemoteDataSource {
  Future<List<BookingDto>> getMyBookings(String token);
}
