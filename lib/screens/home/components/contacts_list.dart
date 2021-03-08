import 'dart:async';

import 'package:contacts_app/constants.dart';
import 'package:contacts_app/contact.dart';
import 'package:contacts_app/screens/home/components/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ContactsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactsListState();
  }
}

class _ContactsListState extends State {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Contact> _contacts = Contact.generateMultipleData();
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => setState(() {}));
  }

  void _addRandomContacts({int number = 5}) {
    _contacts.addAll(Contact.generateMultipleData(number: number));
    _contacts.sort((a, b) => b.checkIn.compareTo(a.checkIn));
    for (int i = 0; i < number; i++) {
      _listKey.currentState.insertItem(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    _contacts.sort((a, b) => b.checkIn.compareTo(a.checkIn));
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: RefreshIndicator(
        onRefresh: () async {
          _addRandomContacts();
        },
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _contacts.length + 1,
          itemBuilder: (context, index, animation) {
            if (index == _contacts.length) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  'You have reached the end of list',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return SizeTransition(
                sizeFactor: animation,
                child: ContactCard(
                  _contacts[index].user,
                  _contacts[index].phone,
                  timeago.format(_contacts[index].checkIn),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
