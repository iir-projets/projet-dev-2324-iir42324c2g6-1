// lib/screens/searchpage.dart
import 'package:flutter/material.dart';
import '../controller/SearchPageController.dart';
import 'package:flightui/models/destinationTicket.dart';

import '../widgets/ticketWidget.dart';

class SearchPage extends StatelessWidget {
  final SearchPageController controller = SearchPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Flights'),
      ),
      body: FutureBuilder<List<DestinationTicket>>(
        future: controller.fetchFlights(),
        builder: (BuildContext context, AsyncSnapshot<List<DestinationTicket>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var flight = snapshot.data![index];
                  if (flight == null ) {
                    return const Text('No flight data');
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjust the vertical spacing here
                    child: TicketShape(flights: flight),
                  );
                },
              );

            } else {
              return const Text('No flights found');
            }
          }
        },
      ),
    );
  }
}