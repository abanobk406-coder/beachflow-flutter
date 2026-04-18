class BookingEntity {
  final String id;
  final String beachName;
  final String beachLocation;
  final String beachImageUrl;
  final String bookingDate;
  final int numberOfPersons;
  final String status;
  final double totalPrice;

  BookingEntity({
    required this.id,
    required this.beachName,
    required this.beachLocation,
    required this.beachImageUrl,
    required this.bookingDate,
    required this.numberOfPersons,
    required this.status,
    required this.totalPrice,
  });
}
