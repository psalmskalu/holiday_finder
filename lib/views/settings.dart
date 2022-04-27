import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.settings),
        centerTitle: true,
      ),
      body: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('Chat Features'),
            onTap: () {
              //
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            onTap: () {
              //Navigator.push(
              //context, MaterialPageRoute(builder: (context) => Inbox()));
            },
          ),
          ListTile(
            title: const Text('Bubbles'),
            onTap: () {},
          ),
          ListTile(
              title: const Text('Hear outgoing message sounds'),
              trailing: const Switch(
                onChanged: null,
                value: false,
                activeColor: Colors.blue,
                activeTrackColor: Colors.blueAccent,
                inactiveThumbColor: Colors.black26,
                inactiveTrackColor: Colors.grey,
              ),
              onTap: () {}),
          ListTile(
            title: const Text('Your current country'),
            subtitle: const Text('Automatically detected (Nigeria)'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Suggestions in chat'),
            subtitle: const Text('Google Assistant, Smart Reply & more'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Automatic previews'),
            subtitle: const Text('Show only web link previews'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Spam protection'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Advanced'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
