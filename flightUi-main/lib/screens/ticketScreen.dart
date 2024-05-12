import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../controller/SearchPageController.dart';
import 'package:flightui/models/destinationTicket.dart';
import '../utils/constants.dart';
import '../utils/textstyles.dart';
import '../widgets/ticketWidget.dart';

class ticketScreen extends StatelessWidget {
  final SearchPageController _controller = SearchPageController();

  int index = 0;
  @override
  Widget build(BuildContext context) {
    var commonSize = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(commonSize.width * 0.05,
              commonSize.height * 0.06, commonSize.width * 0.05, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "My Tickets",
                style: appTextStyle(AppColors.blackColor,
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
        ), //header row
        Padding(
          padding: EdgeInsets.only(
              top: commonSize.height * 0.15, left: commonSize.width * 0.05),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: commonSize.width * 0.05,
                vertical: commonSize.height * 0.014),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor, width: 4),
              color: AppColors.secondaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Text(
              "My Flight",
              style: appTextStyle(AppColors.blackColor,
                  commonSize.width * 0.035, FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: commonSize.height * 0.227, left: commonSize.width * 0.05),
          child: Text(
            "Your Flight in 1 Day",
            style: appTextStyle(
                AppColors.blackColor, commonSize.width * 0.07, FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: commonSize.height * 0.28, right: commonSize.width * 0.02),
          child: Container(
            height: commonSize.height * 0.201,
            width: double.maxFinite,
            child: const Image(
              image: AssetImage("assets/flight-01-01-01.png"),
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: commonSize.height * 0.48, right: commonSize.width * 0.02),
          child: Transform.flip(
            flipY: true,
            child: SizedBox(
              height: commonSize.height * 0.201,
              width: double.maxFinite,
              child: const Image(
                opacity: AlwaysStoppedAnimation(0.15),
                image: AssetImage("assets/flight-01-01-01.png"),
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: commonSize.height * 0.6,
          ),
          child: FutureBuilder<List<DestinationTicket>>(
            future: _controller.fetchFlights(),
            builder: (BuildContext context, AsyncSnapshot<List<DestinationTicket>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                  return ListWheelScrollView(
                    physics: const ClampingScrollPhysics(),
                    diameterRatio: 3,
                    scrollBehavior: const CupertinoScrollBehavior(),
                    itemExtent: MediaQuery.of(context).size.height * 0.2,
                    children: snapshot.data!.map<Widget>((flight) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        child: TicketShape(flights: flight),
                      );
                    }).toList(),
                  );
                } else {
                  return const Text('No flights found');
                }
              }
            },
          ),
        ),

      ],
    );
  }
}
