// lib/models/DestinationTicket.dart
import 'package:flutter/material.dart';

class DestinationTicket {
  final int? flid;
  final String? origin;
  final String? destination;
  final String? departureDate;
  final String? departureTime;
  final double? cost;
  final String? aircraft;
  final String? departureAirportCode;
  final String? arrivalAirportCode;
  final String? flightDurationMinutes;
  final String? arrivalTime;

  DestinationTicket({
    this.flid,
    this.origin,
    this.destination,
    this.departureDate,
    this.departureTime,
    this.cost,
    this.aircraft,
    this.departureAirportCode,
    this.arrivalAirportCode,
    this.flightDurationMinutes,
    this.arrivalTime,
  });

  factory DestinationTicket.fromJson(Map<String, dynamic> json) {
    return DestinationTicket(
      flid: json['flid'],
      origin: json['origin'] as String?,
      destination: json['dest'] as String?,
      departureDate: (json['departureDate'] as String?),
      departureTime: (json['departureTime'] as String?),
      cost: _parseDouble(json['cost']),
      aircraft: json['aircraft'] as String?,
      departureAirportCode: json['departure_airport_code'] as String?,
      arrivalAirportCode: json['arrival_airport_code'] as String?,
      flightDurationMinutes: json['flight_duration_minutes'] as String?,
      arrivalTime: (json['arrivalTime'] as String?),
    );
  }


  // Helper function to parse double from dynamic
  static double? _parseDouble(dynamic cost) {
    if (cost == null) return null;
    if (cost is double) return cost;
    if (cost is String) return double.tryParse(cost);
    throw FormatException('Invalid double format: $cost');
  }
}// Helper function to format time string
String formatTime(String? time) {
  if (time == null) return '';
  final parts = time.split(':');
  if (parts.length != 3) {
    print('Invalid time format: $time');
    return '';
  }
  return '${parts[0]}:${parts[1]}'; // Return time in HH:mm format
}