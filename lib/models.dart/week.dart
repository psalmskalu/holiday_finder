import 'package:intl/intl.dart';

class Week {
  late String weekId;
  late String weekNumber;
  late String dateRange;
  late String holiday;

  Week({
    required this.weekId,
    required this.weekNumber,
    required this.dateRange,
    required this.holiday,
  });

  factory Week.fromJson(Map<String, dynamic> json) {
    return Week(
      weekId: json['week_id'],
      dateRange: json['date_range'],
      weekNumber: json['week_number'],
      holiday: json['holiday'],
    );
  }
}
