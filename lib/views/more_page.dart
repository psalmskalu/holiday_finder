import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:holidays_ai/models.dart/holiday.dart';
import 'package:holidays_ai/utils.dart/app_urls.dart';
import 'package:holidays_ai/views/holiday_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool processing = false;
  List<Holiday> holidays = [];

  Future<List<Holiday>> getHolidays() async {
    setState(() {
      processing = true;
    });

    var url = AppUrl.holidays;

    var res = await http.get(Uri.parse(url));
    print(res.body);
    var response = jsonDecode(res.body);

    if (response["status"] == "false") {
      Fluttertoast.showToast(
          msg: response["message"], toastLength: Toast.LENGTH_LONG);
      setState(() {
        processing = false;
      });
    } else {
      setState(() {
        processing = false;
      });

      List<Holiday> temp = List.from((json.decode(res.body))['holidays'])
          .map((i) => Holiday.fromJson(i))
          .toList();

      return temp;
    }

    return holidays;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            "List of holidays in 2022",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
      Flexible(
        child: FutureBuilder<List<Holiday>>(
          future: getHolidays(),
          initialData: [],
          builder:
              (BuildContext context, AsyncSnapshot<List<Holiday>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                    child: TextButton(
                  child: const Text('Tap here to retry!'),
                  onPressed: () {
                    setState(() {});
                  },
                ));
              } else if (snapshot.hasData) {
                return Visibility(
                    visible: snapshot.hasData,
                    child: processing
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => HolidayDetails(
                                                holiday: snapshot.data![index],
                                              ))));
                                },
                                leading: Text(snapshot.data![index].date),
                                title: Text(snapshot.data![index].holiday),
                              );
                            }));
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        ),
      ),
    ]);
  }
}
