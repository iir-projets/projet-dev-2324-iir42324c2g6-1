import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flightui/models/destinationTicket.dart';

class SearchPageController {
  Future<List<DestinationTicket>> fetchFlights() async {
    final response = await http.get(Uri.parse('http://192.168.208.1:8060/find-flights/'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print('Fetched data: $data'); // Print the fetched data
      return data.map((item) => DestinationTicket.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load flights');
    }
  }
  // New method
  Future<List<DestinationTicket>> findFlights(String origin, String destination) async {
    final response = await http.get(Uri.parse('http://192.168.208.1:8060/find-flights/$origin/$destination'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print('Fetched data: $data'); // Print the fetched data
      return data.map((item) => DestinationTicket.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load flights');
    }
  }
}