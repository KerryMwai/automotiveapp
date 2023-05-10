import 'package:automotiveapp/widgets/time_manager/custom_header_button.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? time;
  @override
  Widget build(BuildContext context) {
    return ButtonHeaderWidget(
        title: "Time", text:getText(), onClicked: () => pickTime(context));
  }

  String getText(){
    if(time==null){
      return "Select Time";
    }else{
      final hours=time!.hour.toString().padLeft(2,"0");
      final minutes=time!.minute.toString().padLeft(2,"0");
      return "$hours:$minutes";
    }
  }

  Future pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
        context: context, initialTime: time ?? initialTime);
    if(newTime==null) return;
    setState((){
       time=newTime;
    }
    );
  }
}
