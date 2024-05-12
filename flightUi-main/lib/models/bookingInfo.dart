class BookingInfo {
  String? destination;
  String? departureDate;
  String? returnDate;
  // Add more fields as necessary

  BookingInfo({this.destination, this.departureDate, this.returnDate});
}

bool _bookingInfoIsFilled(BookingInfo bookingInfo) {
  return bookingInfo.destination != null &&
      bookingInfo.departureDate != null &&
      bookingInfo.returnDate != null;
  // Add more checks as necessary
}