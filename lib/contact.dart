import 'package:faker/faker.dart';

class Contact {
  String user, phone;
  DateTime checkIn;

  Contact({this.user, this.phone, this.checkIn});

  static Contact generateData() {
    return new Contact(
      user: faker.person.name(),
      phone: faker.randomGenerator.fromPattern(['01########', '01#########']),
      checkIn: DateTime.now(),
    );
  }

  static List<Contact> generateMultipleData({int number = 5}) {
    return List.generate(
      number,
      (index) => Contact(
        user: faker.person.name(),
        phone: faker.randomGenerator.fromPattern(['01########', '01#########']),
        checkIn: DateTime.now(),
      ),
    );
  }
}
