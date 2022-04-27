import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:holidays_ai/models.dart/holiday.dart';
import 'package:holidays_ai/utils.dart/app_urls.dart';
import 'package:holidays_ai/views/holiday_details.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DaysPage extends StatefulWidget {
  const DaysPage({Key? key}) : super(key: key);

  @override
  _DaysPageState createState() => _DaysPageState();
}

class _DaysPageState extends State<DaysPage> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  bool processing = false;

  late TextEditingController dayField;

  @override
  void initState() {
    super.initState();
    dayField = TextEditingController();
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );

    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        dayField.text = DateFormat.yMMMEd().format(selectedDate).toString();
      });
    }
  }

  Future getHoliday() async {
    setState(() {
      processing = true;
    });

    var url = AppUrl.holiday;

    var res = await http.post(Uri.parse(url), body: {
      "date": dayField.text,
    });
    print(res.body);
    var response = jsonDecode(res.body);

    if (response["status"] == "false") {
      Fluttertoast.showToast(
          msg: response["message"], toastLength: Toast.LENGTH_LONG);
      setState(() {
        processing = false;
      });
    } else {
      var holiday = Holiday.fromJson(json.decode(res.body)['holiday']);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => HolidayDetails(
                    holiday: holiday,
                  ))));

      setState(() {
        processing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "These are the international days and weeks currently observed by the United Nations.\n\nThe United Nations designates specific days, weeks, years and decades as occasions to mark particular events or topics in order to promote, through awareness and action, the objectives of the Organization. Usually, it is one or more Member States that propose these observances and the General Assembly establishes them with a resolution.\n\nFind out an international day.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  )),
              const SizedBox(
                height: 50,
              ),
              TextField(
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                  controller: dayField,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_view_day,
                      size: 16,
                    ),
                    hintText: 'Select Day',
                  )),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: processing
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text("get Day"),
                onPressed: () => getHoliday(),
              ),
            ])));
  }
}
