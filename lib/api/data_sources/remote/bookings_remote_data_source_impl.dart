import 'package:injectable/injectable.dart';
import 'package:por2/api/api_services.dart';
import 'package:por2/api/data_sources/remote/bookings_remote_data_source.dart';
import 'package:por2/api/models/response/booking_dto.dart';

@Injectable(as: BookingsRemoteDataSource)
class BookingsRemoteDataSourceImpl implements BookingsRemoteDataSource {
  final ApiServices apiServices;

  BookingsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<BookingDto>> getMyBookings(String token) {
    return apiServices.getMyBookings(token);
  }
}
