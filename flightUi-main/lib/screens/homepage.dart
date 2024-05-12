import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:flightui/widgets/ticketWidget.dart';
import '../controller/SearchPageController.dart';
import 'package:flightui/models/destinationTicket.dart';
import '../utils/constants.dart';
import '../utils/textstyles.dart';
import '../widgets/destinationDialog.dart'; // Import SearchPageController

class homePage extends StatelessWidget {
  final SearchPageController controller = SearchPageController();

  @override
  Widget build(BuildContext context) {
    late var commonSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                height: commonSize.height * 0.3,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(commonSize.width * 0.05,
                    commonSize.height * 0.06, commonSize.width * 0.05, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "My Tickets",
                      style: appTextStyle(AppColors.primaryColor,
                          commonSize.width * 0.05, FontWeight.w700),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            radius: (commonSize.width * 0.135) / 2.2,
                            backgroundColor: Colors.grey.shade400,
                            child: const Icon(
                              Octicons.person,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: commonSize.height * 0.14,
                    left: commonSize.width * 0.08,
                    right: commonSize.width * 0.08),
                child: DialogBox(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: commonSize.height * 0.66,
                    left: commonSize.width * 0.08,
                    right: commonSize.width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Popular Flight Routes",
                      style: appTextStyle(AppColors.blackColor,
                          commonSize.width * 0.04, FontWeight.bold),
                    ),
                    Text(
                      "view all",
                      style: appTextStyle(AppColors.blackColor,
                          commonSize.width * 0.03, FontWeight.w700),
                    )
                  ],
                ),
              ),
            ],
          ),
          Gap(commonSize.height * 0.02),
          FutureBuilder<List<DestinationTicket>>(
            future: controller.fetchFlights(),
            builder: (BuildContext context, AsyncSnapshot<List<DestinationTicket>> snapshot) {
              if (snapshot.hasData) {
                // If the future is complete, display the flight tickets
                // Access your data using snapshot.data
                return SizedBox(
                  width: double.maxFinite,
                  height: commonSize.height * 0.2,
                  child: PageView.builder(
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.length, // Replace with actual number of tickets
                    itemBuilder: (context, index) {
                      // Access your data using snapshot.data
                      return Center(
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          // Pass the fetched data to TicketWidget
                          child: TicketShape(flights: snapshot.data?[index]),
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                // If the future completed with an error, display the error
                return Text('Error: ${snapshot.error}');
              } else {
                // If the future is not complete, display a loading spinner
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
