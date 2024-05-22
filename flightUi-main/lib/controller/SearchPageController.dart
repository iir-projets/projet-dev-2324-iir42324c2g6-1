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
  Future<List<DestinationTicket>> findFlights(String fromLocation, String toLocation) async {
    final response = await http.get(Uri.parse('http://192.168.208.1:8060/find-flights/$fromLocation/$toLocation'));
    if (response.statusCode == 200) {

      List<dynamic> data = jsonDecode(response.body);
      print('Fetched data: $data'); // Print the fetched data
      return data.map((item) => DestinationTicket.fromJson(item)).toList();
    } else {

      throw Exception('Failed to load flights');
    }

  }
}
