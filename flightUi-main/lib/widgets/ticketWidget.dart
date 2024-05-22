import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';

import 'package:flightui/models/destinationTicket.dart';

import '../utils/constants.dart';
import '../utils/textstyles.dart';

class TicketShape extends StatelessWidget {
  final DestinationTicket? flights;

  const TicketShape({
    Key? key,
    this.flights,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      child: ClipPath(
        clipper: MyCustomClipper(),
        child: CustomPaint(
          painter: MyCustomPainter(),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: flights != null ? TicketContent(flights: flights!) : const Text('No flight data'),
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }
}

class TicketContent extends StatelessWidget {
  final DestinationTicket flights;

  const TicketContent({
    Key? key,
    required this.flights,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var commonSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Departure City: ${flights.origin}",
                  style: appTextStyle(AppColors.blackColor, commonSize.width * 0.05, FontWeight.w600),
                ),
                Text(
                  "Destination: ${flights.destination}",
                  style: appTextStyle(AppColors.TextColor2, commonSize.width * 0.033, FontWeight.w500),
                ),
                Text(
                  "Departure Date: ${flights.departureDate}",
                  style: appTextStyle(AppColors.TextColor2, commonSize.width * 0.033, FontWeight.w500),
                ),

                Text(
                  "Cost: ${flights.cost}",
                  style: appTextStyle(AppColors.blackColor, commonSize.width * 0.04, FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
        Gap(commonSize.height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: commonSize.width * 0.02),
          child: Container(
            height: commonSize.height * 0.05,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(commonSize.width * 0.321, 0, 0, 0),
                  child: Icon(
                    Ionicons.airplane,
                    size: MediaQuery.of(context).size.width * 0.075,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 7.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${flights.departureTime}",
                        style: appTextStyle(AppColors.blackColor, commonSize.width * 0.033, FontWeight.w600),
                      ),
                      const PointToPointWidget(),
                      Text(
                        "${flights.arrivalTime}",
                        style: appTextStyle(AppColors.blackColor, commonSize.width * 0.033, FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(commonSize.width * 0.03, commonSize.height * 0.018, 0, commonSize.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "YO-Airlines",
                  style: appTextStyle(AppColors.blackColor, commonSize.width * 0.05, FontWeight.w600),
                ),
                Text(
                  "Cost: ${flights.cost}",
                  style: appTextStyle(AppColors.blackColor, commonSize.width * 0.04, FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PointToPointWidget extends StatelessWidget {
  const PointToPointWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.015,
                  width: MediaQuery.of(context).size.height * 0.02,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blackColor, width: 4),
                    shape: BoxShape.circle,
                    color: AppColors.secondaryColor,
                  ),
                ),
                Expanded(
                  child: CustomPaint(
                    painter: DashedPainter(),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.015,
                  width: MediaQuery.of(context).size.height * 0.02,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blackColor, width: 4),
                    shape: BoxShape.circle,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // Semi-circle on the left side
    double radiusLeft = size.height / 12; // adjust the radius as needed
    path.addArc(
      Rect.fromCircle(center: Offset(0, size.height / 1.5), radius: radiusLeft),
      -pi / 2, // Start angle
      pi, // Sweep angle
    );

    // Semi-circle on the right side
    double radiusRight = size.height / 12; // adjust the radius as needed
    path.addArc(
      Rect.fromCircle(
        center: Offset(size.width, size.height / 1.5),
        radius: radiusRight,
      ),
      pi / 2, // Start angle
      pi, // Sweep angle
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class DashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final double dashWidth = 5;
    final double dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.secondaryColor;
    Paint borderPaint = Paint()
      ..color = AppColors.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    double radius = size.height / 12;
    double semiCircleCenterY = size.height / 1.5;

    // Draw the main rectangle
    Rect mainRect = Rect.fromLTWH(0, 0, size.width, size.height);
    RRect mainRRect = RRect.fromRectAndCorners(
      mainRect,
      topLeft: const Radius.circular(20),
      topRight: const Radius.circular(20),
      bottomLeft: const Radius.circular(20),
      bottomRight: const Radius.circular(20),
    );
    canvas.drawRRect(mainRRect, paint);

    Path dashedLinePath = Path();
    dashedLinePath.moveTo(0, semiCircleCenterY);
    double dashWidth = 3;
    double dashSpace = 5;
    double currentX = 0;
    while (currentX < size.width) {
      dashedLinePath.lineTo(currentX + dashWidth, semiCircleCenterY);
      currentX += dashWidth + dashSpace;

      dashedLinePath.moveTo(currentX, semiCircleCenterY);
    }
    Paint dashedBorderPaint = Paint()
      ..color = AppColors.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.square;
    canvas.drawPath(dashedLinePath, dashedBorderPaint);

    // Draw the left semi-circle
    Path leftSemiCirclePath = Path()
      ..addArc(
        Rect.fromCircle(center: Offset(0, semiCircleCenterY), radius: radius),
        -pi / 2,
        pi,
      );
    canvas.drawPath(leftSemiCirclePath, paint);
    canvas.drawPath(leftSemiCirclePath, borderPaint);

    // Draw the right semi-circle
    Path rightSemiCirclePath = Path()
      ..addArc(
        Rect.fromCircle(
          center: Offset(size.width, semiCircleCenterY),
          radius: radius,
        ),
        pi / 2,
        pi,
      );
    canvas.drawPath(rightSemiCirclePath, paint);
    canvas.drawPath(rightSemiCirclePath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
