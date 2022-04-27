import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About this project"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child:
            Column(children: const [Text("This project was desgned by ....")]),
      ),
    );
  }
}
