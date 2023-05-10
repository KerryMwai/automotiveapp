import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/widgets/time_manager/date_picker.dart';
import 'package:automotiveapp/widgets/time_manager/date_range_picker.dart';
import 'package:automotiveapp/widgets/time_manager/time_picker.dart';
import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [
               DatePickerWidget(),
               SizedBox(height: 15,),
               TimePickerWidget(),
               SizedBox(height: 15,),
               DateRangePickerWidget()
            ],
          ),
        ),
      ),
    );
  }
}
