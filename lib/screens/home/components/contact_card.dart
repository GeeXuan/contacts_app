import 'dart:io';

import 'package:contacts_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:vcard/vcard.dart';

class ContactCard extends StatelessWidget {
  final String user, phone, checkIn;
  ContactCard(this.user, this.phone, this.checkIn);

  _onShare(BuildContext context) async {
    var vCard = VCard();

    vCard.firstName = user;
    vCard.cellPhone = phone;
    final path = await getTemporaryDirectory();
    final file = File(path.path + '/$user.vcf');
    print(vCard.getFormattedString());
    file.writeAsString(vCard.getFormattedString());
    await Share.shareFiles([path.path + '/$user.vcf']);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Slidable(
          actionPane: SlidableBehindActionPane(),
          actionExtentRatio: 0.2,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Share',
              color: Colors.indigo,
              icon: Icons.share,
              onTap: () => _onShare(context),
            ),
          ],
          child: Container(
            padding: EdgeInsets.only(
              top: kDefaultPadding * 0.5,
              bottom: kDefaultPadding * 0.5,
              left: kDefaultPadding,
              right: kDefaultPadding,
            ),
            color: kBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                    fontSize: 24,
                  ),
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
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
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }
}
