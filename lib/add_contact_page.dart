import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mid_assignment/contact_info.dart';
import 'package:mid_assignment/contact_info_change_notifier.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  TextEditingController FNameController = TextEditingController();
  TextEditingController LNameController = TextEditingController();
  TextEditingController phone1Controller = TextEditingController();
  TextEditingController phone2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contact"),
      ),
      body: Column(
        children: [
          TextField(
            controller: FNameController,
            decoration: InputDecoration(
              // border: UnderlineInputBorder(),
              hintText: 'First Name',
              labelText: 'First Name',
            ),
          ),
          TextField(
            controller: LNameController,
            decoration: InputDecoration(
              // border: UnderlineInputBorder(),
              hintText: 'Last Name',
              labelText: 'Last Name',
            ),

          ),
          TextField(
            controller: phone1Controller,
            decoration: InputDecoration(
              // border: UnderlineInputBorder(),
              hintText: 'Phone 1',
              labelText: 'Phone 1',
            ),
          ),
          TextField(
            controller: phone2Controller,
            decoration: InputDecoration(
              // border: UnderlineInputBorder(),
              hintText: 'Phone 2',
              labelText: 'Phone 2',
            ),
          ),
          Consumer<ContactInfoChangeNotifier>(
            builder: (context, value, child) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                        child: Text("Add"),
                        onPressed: () {
                          value.addContactInfo(ContactInfo(
                              firstName: FNameController.text,
                              lastName: LNameController.text,
                              phone1: int.parse(phone1Controller.text),
                              phone2: int.parse(phone2Controller.text)));
                          Navigator.of(context).pop();
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }))
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
