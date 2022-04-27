import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holidays_ai/views/about_page.dart';
import 'package:holidays_ai/views/days_page.dart';
import 'package:holidays_ai/views/more_page.dart';
import 'package:holidays_ai/views/settings.dart';
import 'package:holidays_ai/views/weeks_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final pages = [const DaysPage(), const WeeksPage(), const MorePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
              child: const Icon(Icons.settings_sharp)),
        ],
        title: const Text("International Days/Weeks"),
      ),
      body: pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        tooltip: "Add new holiday",
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
              height: 300,
              child: DrawerHeader(
                child: Center(
                    child: Column(
                  children: [
                    Image.asset("assets/images/logo.png", width: 150),
                    const Text(
                      "Holiday Finder",
                      style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                    ),
                  ],
                )),
              )),
          const ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
          ),
          const Divider(
            height: 40,
          ),
          ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
              title: const Text("About Holidays Finder"),
              leading: const Icon(Icons.help)),
          ListTile(
              onTap: () => showAlert(context),
              title: const Text("Exit"),
              leading: const Icon(Icons.logout))
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_view_day_outlined,
                size: 20,
              ),
              label: 'Days'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_view_week_outlined,
                size: 20,
              ),
              label: 'Weeks'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more,
                size: 20,
              ),
              label: 'More'),
        ],
      ),
    );
  }
}

void showAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Wanna Exit?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false), // passing false
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true), // passing true
              child: const Text('Yes'),
            ),
          ],
        );
      }).then((exit) {
    if (exit == null) return;

    if (exit) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      });
    } else {
      // user pressed No button
    }
  });
}
