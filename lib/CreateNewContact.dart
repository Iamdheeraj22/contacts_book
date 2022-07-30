import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewContact extends StatefulWidget {
  CreateNewContact({Key? key}) : super(key: key);
  @override
  State<CreateNewContact> createState() => _CreateNewContactState();
}

class _CreateNewContactState extends State<CreateNewContact> {
  var profileImage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            )),
        title: Text("Create New Contact"),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.done,
              size: 25,
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  child: profileImage.isEmpty
                      ? Image.asset(
                          "assets/con_bg.png",
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(profileImage.toString()),
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                ),
                InkWell(
                  onTap: () {
                    openBottomSheet();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20, bottom: 15),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.camera_alt,
                            size: 35, color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
                title: Text(
                  "Google Account",
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text("dheerajprajapati2875@yopmail.com",
                    style: TextStyle(
                      color: Colors.grey,
                    ))),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    size: 35,
                  ),
                  Column(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  openBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.black,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, state) {
            return Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      open("camera");
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.camera,
                          color: Colors.white,
                          size: 35,
                        )),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      open("gallery");
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.photo_library,
                          color: Colors.white,
                          size: 35,
                        )),
                  )
                ],
              ),
            );
          });
        });
  }

  open(String type) {
    if (type.contains("camera")) {
      pickImage(ImageSource.camera);
    } else if (type.contains("gallery")) {
      pickImage(ImageSource.gallery);
    }
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        profileImage = File(image.path).path;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
