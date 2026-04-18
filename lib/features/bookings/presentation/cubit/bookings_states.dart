import 'package:por2/domain/entities/response/booking_entity.dart';

abstract class BookingsStates {}

class BookingsInitialState extends BookingsStates {}

class BookingsLoadingState extends BookingsStates {}

class BookingsSuccessState extends BookingsStates {
  final List<BookingEntity> bookings;
  BookingsSuccessState({required this.bookings});
}

class BookingsErrorState extends BookingsStates {
  final String message;
  BookingsErrorState({required this.message});
}
