import 'package:intl/intl.dart';

class Holiday {
  late String holidayId;
  late String date;
  late String holiday;
  late String details;

  Holiday({
    required this.holidayId,
    required this.date,
    required this.holiday,
    required this.details,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
      holidayId: json['holiday_id'],
      date: DateFormat.yMMMEd().format(DateTime.parse(json['date'])),
      holiday: json['holiday'],
      details: json['details'],
    );
  }
}
