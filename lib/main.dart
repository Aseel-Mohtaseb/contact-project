import 'package:flutter/material.dart';
import 'package:mid_assignment/contact_info_change_notifier.dart';
import 'package:mid_assignment/contacts_list_page.dart';
import 'package:provider/provider.dart';

import 'add_contact_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => ContactInfoChangeNotifier(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/ContactsListPage',
      routes: {
        '/ContactsListPage' : (context)=>ContactsListPage(),
        '/AddContactPage' : (context)=>AddContactPage(),
      },
    );
  }
}
