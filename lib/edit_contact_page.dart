import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mid_assignment/contact_info.dart';
import 'package:provider/provider.dart';

import 'contact_info_change_notifier.dart';

class EditContactPage extends StatefulWidget {
  int index;

  EditContactPage({required this.index});

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("edit contact"),
        ),
        body: Consumer<ContactInfoChangeNotifier>(
          builder: (context, value, child) {
            TextEditingController FNameController = TextEditingController(
                text: value.getContactInfo(widget.index).firstName);
            TextEditingController LNameController = TextEditingController(
                text: value.getContactInfo(widget.index).lastName);
            TextEditingController phone1Controller = TextEditingController(
                text: value.getContactInfo(widget.index).phone1.toString());
            TextEditingController phone2Controller = TextEditingController(
                text: value.getContactInfo(widget.index).phone2.toString());
            return Column(
              children: [
                TextField(
                  controller: FNameController,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    labelText: 'First Name',
                  ),
                ),
                TextField(
                  controller: LNameController,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    labelText: 'Last Name',
                  ),
                ),
                TextField(
                  controller: phone1Controller,
                  decoration: InputDecoration(
                    hintText: 'Phone 1',
                    labelText: 'Plone 1',
                  ),
                ),
                TextField(
                  controller: phone2Controller,
                  decoration: InputDecoration(
                    hintText: 'Phone 2',
                    labelText: 'Phone 2',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        value.updateContentInfo(
                            widget.index,
                            ContactInfo(
                              firstName: FNameController.text,
                              lastName: LNameController.text,
                              phone1: int.parse(phone1Controller.text),
                              phone2: int.parse(phone2Controller.text),
                            ));
                        Navigator.popUntil(
                            context, ModalRoute.withName('/ContactsListPage'));
                      },
                      child: Text("edit")),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pop(context);
                        // Navigator.pushNamed(context, '/ContactsListPage');
                        // Navigator.pushReplacementNamed(context, '/ContactsListPage');
                        Navigator.popUntil(
                            context, ModalRoute.withName('/ContactsListPage'));
                      },
                      child: Text("cancel")),
                )
              ],
            );
          },
        ));
  }
}
