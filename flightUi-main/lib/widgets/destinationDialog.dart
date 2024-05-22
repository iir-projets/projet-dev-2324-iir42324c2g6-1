// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flightui/utils/constants.dart';
import 'package:flightui/utils/textstyles.dart';
import 'package:flightui/widgets/ticketWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:flightui/controller/SearchPageController.dart';
import '../models/DestinationTicket.dart';

class DialogBox extends StatefulWidget {
  DialogBox({super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  final FocusNode fromFocusNode = FocusNode();
  final FocusNode toFocusNode = FocusNode();
  final FocusNode whenFocusNode = FocusNode();
  final FocusNode returnFocusNode = FocusNode();
  final FocusNode passengersFocusNode = FocusNode();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _returnDateController = TextEditingController();

  DateTime? _selectedDate;
  bool isRoundTrip = false;

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 90)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.blackColor,
              onPrimary: AppColors.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    } else {
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    var commonSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTripTypeButton("One Way", false),
              const SizedBox(width: 15),
              _buildTripTypeButton("Round Trip", true),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: commonSize.height * 0.06),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: isRoundTrip ? commonSize.height * 0.45 : commonSize.height * 0.42,
            width: commonSize.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.1),
                  offset: const Offset(1, 2),
                  blurRadius: 2,
                  spreadRadius: 1,
                ),
              ],
              border: Border.all(color: AppColors.borderColor, width: 2),
              color: AppColors.secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRoundedTextField(
                      hintText: "From?",
                      iconData: MaterialIcons.flight_takeoff,
                      focusNode: fromFocusNode,
                      controller: _fromController,
                    ),
                    _buildRoundedTextField(
                      hintText: "Where to?",
                      iconData: MaterialIcons.flight_land,
                      focusNode: toFocusNode,
                      controller: _toController,
                    ),
                    if (isRoundTrip)
                      Column(
                        children: [
                          _buildRoundedTextField(
                            hintText: "Travelling when?",
                            iconData: MaterialCommunityIcons.calendar_arrow_right,
                            focusNode: whenFocusNode,
                            controller: _dateController,
                            isEnabled: true,
                            onTap: () => _selectDate(context, _dateController),
                          ),
                          Gap(commonSize.height * 0.008),
                          _buildRoundedTextField(
                            hintText: "Return when?",
                            iconData: MaterialCommunityIcons.calendar_arrow_left,
                            focusNode: returnFocusNode,
                            controller: _returnDateController,
                            isEnabled: true,
                            onTap: () => _selectDate(context, _returnDateController),
                          ),
                        ],
                      )
                    else
                      _buildRoundedTextField(
                        hintText: "When?",
                        iconData: MaterialCommunityIcons.calendar_month,
                        focusNode: whenFocusNode,
                        controller: _dateController,
                        isEnabled: true,
                        onTap: () => _selectDate(context, _dateController),
                      ),
                    _buildRoundedTextField(
                      hintText: "Passengers: 01",
                      iconData: MaterialIcons.person,
                      focusNode: passengersFocusNode,
                    ),
                    GestureDetector(
                      onTap: _searchFlight,
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          "Search Flight",
                          style: appTextStyle(AppColors.primaryColor, 12, FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: commonSize.width * 0.1,
                  top: commonSize.height * 0.045,
                  child: CircleAvatar(
                    backgroundColor: AppColors.blackColor,
                    radius: commonSize.width * (isRoundTrip ? 0.07 : 0.075),
                    child: Icon(
                      CupertinoIcons.arrow_swap,
                      size: commonSize.width * 0.06,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTripTypeButton(String title, bool value) {
    return GestureDetector(
      onTap: () => setState(() => isRoundTrip = value),
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        ),
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Text(
          title,
          style: appTextStyle(
            AppColors.blackColor,
            value == isRoundTrip
                ? MediaQuery.of(context).size.height * 0.02
                : MediaQuery.of(context).size.height * 0.018,
            value == isRoundTrip ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedTextField({
    required String hintText,
    required IconData iconData,
    required FocusNode focusNode,
    TextEditingController? controller,
    bool? isEnabled = false,
    void Function()? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor, width: 2),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            child: Icon(iconData),
          ),
          Container(
            width: 1.0,
            height: 30.0,
            color: AppColors.blackColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: TextField(
                onTap: onTap,
                controller: controller,
                readOnly: isEnabled ?? false,
                focusNode: focusNode,
                style: appTextStyle(Colors.grey.shade600, 14, FontWeight.w600),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  hintText: hintText,
                  hintStyle: appTextStyle(Colors.grey.shade500, 12, FontWeight.w600),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _searchFlight() {
    final SearchPageController _searchPageController = SearchPageController();

    void _searchFlight() {
      SearchPageController controller = SearchPageController();

      if (_fromController.text.isNotEmpty && _toController.text.isNotEmpty) {
        if (_fromController.text.isNotEmpty && _toController.text.isNotEmpty) {
          // Use the instance to call findFlights
          controller.findFlights(_fromController.text, _toController.text);
          _searchPageController.findFlights(_fromController.text, _toController.text);
        } else if (_fromController.text.isEmpty && _toController.text.isEmpty) {
          controller.fetchFlights();
        }
      }
    }}}