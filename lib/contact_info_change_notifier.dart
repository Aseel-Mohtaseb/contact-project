import 'package:flutter/cupertino.dart';
import 'package:mid_assignment/contact_info.dart';

class ContactInfoChangeNotifier extends ChangeNotifier{
  List<ContactInfo> _contactsInfo = [];

  void addContactInfo(ContactInfo contactInfo){
    _contactsInfo.add(contactInfo);
    notifyListeners();
  }

  int get length => _contactsInfo.length;

  List<ContactInfo> getContactsInfo(){
    return _contactsInfo;
  }

  ContactInfo getContactInfo(int index) => _contactsInfo[index];

  void deleteContactInfo(int index){
    _contactsInfo.removeAt(index);
    notifyListeners();
  }

  void updateContentInfo(int index, ContactInfo contactInfo){
    _contactsInfo[index] = contactInfo;
    notifyListeners();
  }


}