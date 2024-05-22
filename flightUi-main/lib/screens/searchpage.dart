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
        future: controller.findFlights("Chicago","Miami"),
        builder: (BuildContext context, AsyncSnapshot<List<DestinationTicket>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
              print('Fetched data: ${snapshot.data}');
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var flight = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TicketShape(flights: flight),
                  );
                },
              );
            } else {
              print('No flights found');
              return const Center(child: Text('No flights found'));
            }
          }
        },
      ),
    );
  }
}
