import 'package:flutter/material.dart';
import 'package:holidays_ai/models.dart/week.dart';

class WeekDetails extends StatefulWidget {
  final Week week;
  const WeekDetails({Key? key, required this.week}) : super(key: key);

  @override
  _WeekDetailsState createState() => _WeekDetailsState();
}

class _WeekDetailsState extends State<WeekDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.week.dateRange)),
        body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Week: " + widget.week.weekNumber),
                ListTile(
                  title: Text(widget.week.dateRange),
                  leading: const Icon(Icons.lock_clock_outlined),
                ),
                Text(widget.week.holiday)
              ],
            )));
  }
}
