import 'package:contacts_app/constants.dart';
import 'package:contacts_app/contact.dart';
import 'package:contacts_app/screens/home/components/contact_card.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ContactsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactsListState();
  }
}

class _ContactsListState extends State {
  List<Contact> _contacts = [
    new Contact(
      user: faker.person.name(),
      phone: faker.randomGenerator.fromPattern(['01########', '01#########']),
      checkIn: DateTime.now(),
    ),
    new Contact(
      user: faker.person.name(),
      phone: faker.randomGenerator.fromPattern(['01########', '01#########']),
      checkIn: DateTime.now(),
    ),
    new Contact(
      user: faker.person.name(),
      phone: faker.randomGenerator.fromPattern(['01########', '01#########']),
      checkIn: DateTime.now(),
    ),
    new Contact(
      user: faker.person.name(),
      phone: faker.randomGenerator.fromPattern(['01########', '01#########']),
      checkIn: DateTime.now(),
    ),
    new Contact(
      user: faker.person.name(),
      phone: faker.randomGenerator.fromPattern(['01########', '01#########']),
      checkIn: DateTime.now(),
    )
  ];

  void _addRandomContacts() {
    var faker = new Faker();
    setState(() {
      for (int i = 0; i < 5; i++) {
        _contacts.add(new Contact(
          user: faker.person.name(),
          phone:
              faker.randomGenerator.fromPattern(['01########', '01#########']),
          checkIn: DateTime.now(),
        ));
      }
    });
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
        child: ListView.builder(
          itemCount: _contacts.length,
          padding: const EdgeInsets.all(kDefaultPadding),
          itemBuilder: (BuildContext context, int index) {
            return ContactCard(
              _contacts[index].user,
              _contacts[index].phone,
              timeago.format(_contacts[index].checkIn),
            );
          },
        ),
      ),
    );
  }
}
