import 'package:injectable/injectable.dart';
import 'package:por2/domain/entities/response/booking_entity.dart';
import 'package:por2/domain/repositories/bookings_repository.dart';

@injectable
class GetMyBookingsUseCase {
  final BookingsRepository repository;

  GetMyBookingsUseCase({required this.repository});

  Future<List<BookingEntity>> invoke(String token) {
    return repository.getMyBookings(token);
  }
}
