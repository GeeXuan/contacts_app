import 'package:contacts_app/constants.dart';
import 'package:contacts_app/screens/home/components/contacts_list.dart';
import 'package:contacts_app/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: kDefaultPadding),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              child: Icon(
                Icons.settings,
              ),
            ),
          ),
        ],
      ),
      body: ContactsList(),
    );
  }
}
