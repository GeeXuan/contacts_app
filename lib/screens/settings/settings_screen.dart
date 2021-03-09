import 'package:contacts_app/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(children: <Widget>[
        SwitchListTile(
          title: new Text('Receive notification'),
          value: prefs.getBool('enableLocalNotification'),
          onChanged: (bool value) {
            setState(() {
              saveSwitchState(value);
              if (value) {
                periodicNotification();
              } else {
                flutterLocalNotificationsPlugin.cancelAll();
              }
            });
          },
        )
      ]),
    );
  }

  Future<bool> saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("enableLocalNotification", value);
  }

  Future<bool> getSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("enableLocalNotification");
  }
}
