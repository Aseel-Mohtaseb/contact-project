import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mid_assignment/add_contact_page.dart';
import 'package:mid_assignment/contact_info_change_notifier.dart';
import 'package:mid_assignment/edit_contact_page.dart';
import 'package:provider/provider.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({Key? key}) : super(key: key);

  @override
  _ContactsListPageState createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts List"),),
      body: Consumer<ContactInfoChangeNotifier>(
        builder: (context, value, child) {
          if(value.length == 0){
            return
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No Contacts Available',style: TextStyle(fontSize: 20),)
                  ],
                )
              ],
            );


          }
          return ListView.builder(
            itemCount: value.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return  AlertDialog(
                            title: Text(value.getContactInfo(index).firstName + " " + value.getContactInfo(index).lastName,
                            style: TextStyle(color: Colors.blue),),
                            content: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("phone1: " + value.getContactInfo(index).phone1.toString()),
                                  Text("phone1: " + value.getContactInfo(index).phone2.toString()),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => EditContactPage(index: index,),));
                                  },
                                  child: Text("edit")
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    value.deleteContactInfo(index);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("delete")
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("close")
                              ),
                            ],
                          );
                        },
                    );
                  },

                  child: Card(
                    child:  Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 15),
                            child: CircleAvatar(
                              child: Text(value.getContactInfo(index).firstName.characters.first,
                                style: TextStyle(fontSize: 20),),
                              radius: 30.0,
                              backgroundColor: Colors.blue,

                            ),
                          ),

                          Text(value.getContactInfo(index).firstName + " " + value.getContactInfo(index).lastName,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),

                    )

                  )
                );
              },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddContactPage(),));},
        child: Icon(Icons.add),
      ),
    );
  }

}
