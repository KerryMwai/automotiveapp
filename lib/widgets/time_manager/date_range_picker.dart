import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/widgets/time_manager/custom_header_button.dart';
import 'package:flutter/material.dart';

class DateRangePickerWidget extends StatefulWidget {
  const DateRangePickerWidget({super.key});

  @override
  State<DateRangePickerWidget> createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTimeRange? dateRange;

    String getFrom() {
    if (dateRange == null) {
      return "From";
    } else {
      // return DateFormat("MM/dd/yyyy").format(dateRange.start);
      return "${dateRange!.start.month}/${dateRange!.start.day}/${dateRange!.start.year}";
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return "Until";
    } else {
      // return DateFormat("MM/dd/yyyy").format(dateRange.end);
      return "${dateRange!.end.month}/${dateRange!.end.day}/${dateRange!.end.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: HeaderWidget(
          title: "Date Range",
          child: Column(
            children: [
              ButtonWidget(
                  text: getFrom(), onClicked: () => pickDateRange(context)),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.arrow_forward,
                color: white,
              ),
              const SizedBox(
                width: 8,
              ),
              ButtonWidget(
                  text: getUntil(), onClicked: () => pickDateRange(context)),
            ],
          )),
    );
  }



  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(hours: 24 * 3)));
    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 60),
        lastDate: DateTime(DateTime.now().year + 60),
        initialDateRange: dateRange ?? initialDateRange);

    if (dateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
}
