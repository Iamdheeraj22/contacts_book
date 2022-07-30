import 'dart:typed_data';

import 'package:contacts_book/CreateNewContact.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class AllContactsPage extends StatefulWidget {
  bool isGranted = false;
  AllContactsPage({Key? key, required this.isGranted}) : super(key: key);

  @override
  State<AllContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<AllContactsPage> {
  Iterable<Contact>? _contacts;

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
      print(_contacts!.length.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateNewContact()));
            },
            child: Icon(Icons.add)),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Contacts Book",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: widget.isGranted
                ? _contacts!.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.only(top: 15, left: 5, right: 5),
                        itemCount: _contacts!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Contact contact = _contacts!.elementAt(index);
                          return ListTile(
                            leading: contact.avatar!.isNotEmpty
                                ? CircleAvatar(
                                    backgroundImage: MemoryImage(
                                        contact.avatar!.buffer.asUint8List()))
                                : CircleAvatar(
                                    radius: 30,
                                    child: Text(
                                      contact.displayName!
                                          .substring(0, 1)
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                            title: Text(
                              contact.displayName.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        })
                    : Center(
                        child: Text(widget.isGranted.toString()),
                      )
                : const Center(
                    child: Text(""),
                  )));
  }
}
