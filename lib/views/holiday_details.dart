import 'package:flutter/material.dart';
import 'package:holidays_ai/models.dart/holiday.dart';

class HolidayDetails extends StatefulWidget {
  final Holiday holiday;
  const HolidayDetails({Key? key, required this.holiday}) : super(key: key);

  @override
  _HolidayDetailsState createState() => _HolidayDetailsState();
}

class _HolidayDetailsState extends State<HolidayDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.holiday.date)),
        body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Holiday: " + widget.holiday.holiday),
                ListTile(
                  title: Text(widget.holiday.date),
                  leading: const Icon(Icons.lock_clock_outlined),
                ),
                Text(widget.holiday.details)
              ],
            )));
  }
}
