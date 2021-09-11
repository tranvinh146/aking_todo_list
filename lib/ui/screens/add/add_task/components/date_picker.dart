import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDatePicker(
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2040),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: redPrimaryColor, // header background color
                  onPrimary: Colors.black, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: bluePrimaryColor, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        ).then((date) {
          setState(() {
            _selectedDate = date;
          });
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: bluePrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Text(
          _selectedDate == null
              ? "Anytime"
              : "${_selectedDate!.day.toString()}/${_selectedDate!.month.toString()}/${_selectedDate!.year.toString()}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
