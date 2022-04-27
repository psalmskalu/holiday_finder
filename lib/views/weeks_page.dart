import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:holidays_ai/models.dart/week.dart';
import 'package:holidays_ai/utils.dart/app_urls.dart';
import 'package:holidays_ai/views/week_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeeksPage extends StatefulWidget {
  const WeeksPage({Key? key}) : super(key: key);

  @override
  _WeeksPageState createState() => _WeeksPageState();
}

class _WeeksPageState extends State<WeeksPage> {
  String? week;
  bool processing = false;

  Future getWeek() async {
    setState(() {
      processing = true;
    });

    var url = AppUrl.week;

    var res = await http.post(Uri.parse(url), body: {
      "number": week,
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
      var week = Week.fromJson(json.decode(res.body)['week']);
      print(week);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => WeekDetails(
                    week: week,
                  ))));

      setState(() {
        processing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      const SizedBox(
        height: 40,
      ),
      const Text(
        "Year: 2022",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
      ),
      Container(
        margin: const EdgeInsets.all(20),
        child: const Text(
          "There are 52 weeks in the year 2022. You can find the weeks that are marked as Internation weeks by the United Nations. The United Nations marks certain days and weeks to recognize and celebrate certain person, persons, achievement, cause or concept",
          style: TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
      Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: DropdownButton(
                      isExpanded: true,
                      isDense: true,
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      borderRadius: BorderRadius.circular(20),
                      value: week,
                      hint: const Text(
                        "Select Week",
                      ),
                      items: const [
                        DropdownMenuItem(
                          child: Text("Week 1 (January 3 - 9)"),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 2 (January 10 -16)",
                          ),
                          value: "2",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 3 (January 17 - 23)",
                          ),
                          value: "3",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 4 (January 24 - 30)",
                          ),
                          value: "4",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 5 (January 31 - Febraury 6)",
                          ),
                          value: "5",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 6 (February 7 - 13)",
                          ),
                          value: "6",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 7 (February 14 - 20)",
                          ),
                          value: "7",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 8 (February 21 - 27)",
                          ),
                          value: "8",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 9 (February 28 - March 6)",
                          ),
                          value: "9",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 10 (March 7 - 13)",
                          ),
                          value: "10",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 11 (March 14 - 20)",
                          ),
                          value: "11",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 12 (March 21 - 21)",
                          ),
                          value: "12",
                        ),
                        DropdownMenuItem(
                          child: Text("Week 13 (March 28 - April 3"),
                          value: "13",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 14 (April 4 - 10)",
                          ),
                          value: "14",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 15 (April 11 - 17)",
                          ),
                          value: "15",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 16 (April 18 - 24)",
                          ),
                          value: "16",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 17 (April 25 - May 1)",
                          ),
                          value: "17",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 18 (May 2 - 8)",
                          ),
                          value: "18",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 19 (May 9 - 15)",
                          ),
                          value: "19",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 20 (May 16 - 22)",
                          ),
                          value: "20",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 21 (May 23 - 29)",
                          ),
                          value: "21",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 22 (May 30 - June 5)",
                          ),
                          value: "22",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 23 (June 6 - 12)",
                          ),
                          value: "23",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 24 (June 13 - 19)",
                          ),
                          value: "24",
                        ),
                        DropdownMenuItem(
                          child: Text("Week 25 (June 20 - 26)"),
                          value: "25",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 26 (June 27 - July 3)",
                          ),
                          value: "26",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 27 (July 4 - 10)",
                          ),
                          value: "27",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 28 (July 11 -17)",
                          ),
                          value: "28",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 29 (July 18 - 24)",
                          ),
                          value: "29",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 30 (July 24 - 31)",
                          ),
                          value: "30",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 31 (Aug 1 - 7)",
                          ),
                          value: "31",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 32(Aug 8 - 14)",
                          ),
                          value: "32",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 33 (Aug 15 - 21)",
                          ),
                          value: "33",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 34 (Aug 22 - 28)",
                          ),
                          value: "34",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 35 (Aug 29 - Sept 4)",
                          ),
                          value: "35",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 36 (Sept 5 - 11)",
                          ),
                          value: "36",
                        ),
                        DropdownMenuItem(
                          child: Text("Week 37 (Sept 12 - 18)"),
                          value: "37",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 38 (Sept 19 - 25)",
                          ),
                          value: "38",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 39 (Sept 26 - Oct 3)",
                          ),
                          value: "39",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 40 (Oct 3 - 9)",
                          ),
                          value: "40",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 41 (Oct 10 - 16)",
                          ),
                          value: "41",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 42 (Oct 17 - 23)",
                          ),
                          value: "42",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 43 (Oct 24 - 30)",
                          ),
                          value: "43",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 44 (Oct 31 - Nov 6)",
                          ),
                          value: "44",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 45 (Nov 7 -  13)",
                          ),
                          value: "45",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 46 (Nov 14 -  20)",
                          ),
                          value: "46",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 47 (Nov 21 -  27)",
                          ),
                          value: "47",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 48 (Nov 28 -  Dec 4)",
                          ),
                          value: "48",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 49 (Dec 5 -  11)",
                          ),
                          value: "49",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 50 (Dec 12 -  18)",
                          ),
                          value: "50",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 51 (Dec 19 - 25)",
                          ),
                          value: "51",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Week 52 (Dec 26 - Jan 1, 2023)",
                          ),
                          value: "52",
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          week = value ?? "";
                        });
                      })),
            ],
          )),
      const SizedBox(
        height: 10,
      ),
      ElevatedButton(
        onPressed: () => getWeek(),
        child: processing
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text("Get week"),
      )
    ]));
  }
}
