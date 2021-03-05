import 'package:contacts_app/constants.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String user, phone, checkIn;
  ContactCard(this.user, this.phone, this.checkIn);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              user,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextColor,
                fontSize: 24,
              ),
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  phone,
                  style: TextStyle(
                    color: kTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                flex: 3,
              ),
              Expanded(
                child: Text(
                  checkIn,
                  style: TextStyle(
                    color: kTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                ),
                flex: 7,
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
