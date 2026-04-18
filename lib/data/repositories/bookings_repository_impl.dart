import 'package:injectable/injectable.dart';
import 'package:por2/api/data_sources/remote/bookings_remote_data_source.dart';
import 'package:por2/domain/entities/response/booking_entity.dart';
import 'package:por2/domain/repositories/bookings_repository.dart';

@Injectable(as: BookingsRepository)
class BookingsRepositoryImpl implements BookingsRepository {
  final BookingsRemoteDataSource bookingsRemoteDataSource;

  BookingsRepositoryImpl({required this.bookingsRemoteDataSource});

  @override
  Future<List<BookingEntity>> getMyBookings(String token) async {
    final dtos = await bookingsRemoteDataSource.getMyBookings(token);
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}
