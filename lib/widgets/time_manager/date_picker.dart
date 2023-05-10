import 'package:automotiveapp/widgets/time_manager/custom_header_button.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? date;

  String getText(){
    if(date==null){
      return "Select Date";
    }else{
      // In pubspec.yaml file add the puckage (intl:) and use it to format the date time as follows
      // return DateTime('MM/dd/yyyy').format(date); or
      // return DateTime('MM-dd-yyyy').format(date); or
      return "${date!.month}/${date!.day}/${date!.year}";
    }
  }
  @override
  Widget build(BuildContext context) =>
      ButtonHeaderWidget(title: "Date",
       text:getText(),
       onClicked: ()=>pickDate(context));
  
  Future pickDate(BuildContext context)async{
    final initialDate=DateTime.now();
    final newDate=await showDatePicker(
        context: context,
        initialDate: date ?? initialDate,
        firstDate: DateTime(DateTime.now().year-90),
        lastDate: DateTime(DateTime.now().year+20)
      );
    if(newDate==null) return;

    setState(()=>date=newDate);
  }
}
