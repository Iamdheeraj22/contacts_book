import 'dart:io';
import 'package:contacts_book/Common.dart';
import 'package:contacts_book/Model/Googleaccount.dart';
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
  var profileImage1 = "";

  bool isBasicShow = false;
  String accountType = "Select account";
  String accountValue = "";
  List<Accounts> _accounts = [
    Accounts(type: "google", value: "dheerajprajprajapati@gmail.com"),
    Accounts(type: "sim", value: "Jio 4G 01"),
    Accounts(type: "google", value: "dheeraj@gmail.com"),
    Accounts(type: "google", value: "prajprajapati@gmail.com"),
    Accounts(type: "phone", value: "Phone"),
    Accounts(type: "google", value: "dheerajprajpr125@gmail.com"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              )),
          title: const Text("Create New Contact"),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.done,
                size: 25,
              ),
            )
          ],
        ),
        body: isBasicShow ? allFields() : basicFields());
  }

  //BasicFields
  Widget basicFields() {
    return Container(
      height: height(context),
      width: width(context),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              height: 5,
            ),
            //Name prefix
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 40,
              ),
              title: Container(
                height: 27,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 1.8))),
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    //phoneNumber = value.toString();
                  },
                  // controller: _phoneController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      isBasicShow = !isBasicShow;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down)),
            ),
            Visibility(
                visible: isBasicShow,
                child: Column(
                  children: [
                    //Given Name
                    ListTile(
                      title: Container(
                        margin: EdgeInsets.only(left: 55, right: 66),
                        height: 27,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.blue, width: 1.8))),
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            //phoneNumber = value.toString();
                          },
                          // controller: _phoneController,
                          decoration: const InputDecoration(
                            hintText: "Given Name",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    //Middle Name
                    ListTile(
                      title: Container(
                        margin: EdgeInsets.only(left: 55, right: 66),
                        height: 27,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.blue, width: 1.8))),
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            //phoneNumber = value.toString();
                          },
                          // controller: _phoneController,
                          decoration: const InputDecoration(
                            hintText: "Middle Name",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    //Family Name
                    ListTile(
                      title: Container(
                        margin: EdgeInsets.only(left: 55, right: 66),
                        height: 27,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.blue, width: 1.8))),
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            //phoneNumber = value.toString();
                          },
                          // controller: _phoneController,
                          decoration: const InputDecoration(
                            hintText: "Family Name",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    //Name suffix
                    ListTile(
                      title: Container(
                        margin: EdgeInsets.only(left: 55, right: 66),
                        height: 27,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.blue, width: 1.8))),
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            //phoneNumber = value.toString();
                          },
                          // controller: _phoneController,
                          decoration: const InputDecoration(
                            hintText: "Name Suffix",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            //Phone Number
            ListTile(
              leading: const Icon(
                Icons.call,
                size: 40,
              ),
              title: Container(
                margin: EdgeInsets.only(right: 65),
                height: 27,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 1.8))),
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    //phoneNumber = value.toString();
                  },
                  // controller: _phoneController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Email address
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 40,
              ),
              title: Container(
                margin: EdgeInsets.only(right: 65),
                height: 27,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 1.8))),
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    //phoneNumber = value.toString();
                  },
                  // controller: _phoneController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 18),
                child: TextButton(onPressed: () {}, child: Text("More Fields")))
          ],
        ),
      ),
    );
  }

  //all fields
  Widget allFields() {
    return Container(
        height: height(context),
        width: width(context),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          customBox(height: 10),
          //Select account
          InkWell(
            onTap: () {
              showSelectaccount();
            },
            child: ListTile(
              leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black54,
                  child: Icon(
                    Icons.person_sharp,
                    color: Colors.white,
                  )),
              title: Container(
                width: 500,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(accountType.toString().toUpperCase()),
                        Text(
                          accountValue.toString().toLowerCase(),
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    customBox(width: 50),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
            ),
          ),
          customBox(height: 15),

          //Full name
          ListTile(
            leading: const Icon(
              Icons.person,
              size: 40,
            ),
            title: Container(
              margin: EdgeInsets.only(right: 55),
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "Please enter a name"),
              ),
            ),
          ),

          //Phonetic name
          ListTile(
            title: Container(
              margin: EdgeInsets.only(left: 55, right: 55),
              height: 27,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "Please enter phonetic name"),
              ),
            ),
          ),

          //Nickname
          ListTile(
            title: Container(
              margin: EdgeInsets.only(left: 55, right: 55),
              height: 27,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "Nickname"),
              ),
            ),
          ),
          customBox(height: 10),
          //Select profile image
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              size: 35,
            ),
            title: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: profileImage1 == ""
                        ? Color.fromARGB(115, 122, 122, 122)
                        : null,
                  ),
                  height: 70,
                  width: 70,
                  child: profileImage1 == ""
                      ? Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        )
                      : Image.file(File(profileImage1)),
                ),
                customBox(width: 20),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 15),
                      child: Text("Change")),
                )
              ],
            ),
          ),
          customBox(height: 15),
          //Phone number
          ListTile(
            leading: const Icon(
              Icons.call,
              size: 35,
            ),
            title: Container(
              margin: EdgeInsets.only(right: 55),
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "Phone number"),
              ),
            ),
          ),
          customBox(height: 5),
          //Email address
          ListTile(
            leading: const Icon(
              Icons.email,
              size: 35,
            ),
            title: Container(
              margin: EdgeInsets.only(right: 55),
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "E-mail address"),
              ),
            ),
          ),
          customBox(height: 5),
          //IM
          ListTile(
            leading: const Icon(
              Icons.message,
              size: 35,
            ),
            title: Container(
              margin: EdgeInsets.only(right: 55),
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "IM"),
              ),
            ),
          ),
          customBox(height: 5),
          //Street
          ListTile(
            leading: const Icon(
              Icons.location_pin, //Phonetic name,
              size: 35,
            ),
            title: Container(
              margin: EdgeInsets.only(right: 55),
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "Street"),
              ),
            ),
          ),
          customBox(height: 5),
          //PO box
          ListTile(
            title: Container(
              margin: EdgeInsets.only(left: 55, right: 55),
              height: 27,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "Please enter phonetic name"),
              ),
            ),
          ),
          customBox(height: 5),
          //Neighborhood
          ListTile(
            title: Container(
              margin: EdgeInsets.only(left: 55, right: 55),
              height: 27,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "Neighborhood"),
              ),
            ),
          ),
          customBox(height: 5),
          //City
          ListTile(
            title: Container(
              margin: EdgeInsets.only(left: 55, right: 55),
              height: 27,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "City"),
              ),
            ),
          ),
          customBox(height: 5),
          //City
          ListTile(
            title: Container(
              margin: EdgeInsets.only(left: 55, right: 55),
              height: 27,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "Pin Code"),
              ),
            ),
          ),
          customBox(height: 5),
          //City
          ListTile(
            title: Container(
              margin: EdgeInsets.only(left: 55, right: 55),
              height: 27,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.blue, width: 1.8))),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  //phoneNumber = value.toString();
                },
                // controller: _phoneController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    hintText: "Country"),
              ),
            ),
          ),
        ])));
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

  showSelectaccount() {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
              insetPadding: EdgeInsets.zero,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              content: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Select account",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _accounts.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    accountType = _accounts[index].type;
                                    accountValue = _accounts[index].value;
                                    Navigator.pop(context);
                                  });
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        _accounts[index].type == "google"
                                            ? Colors.white
                                            : Colors.black26,
                                    backgroundImage:
                                        _accounts[index].type == "google"
                                            ? AssetImage("assets/google.png")
                                            : null,
                                    child: _accounts[index].type != "google"
                                        ? Icon(
                                            _accounts[index].type == "sim"
                                                ? Icons.sim_card
                                                : Icons.phone_android,
                                            color: Colors.white)
                                        : null,
                                  ),
                                  title:
                                      Text(_accounts[index].type.toUpperCase()),
                                  subtitle: Text(
                                      _accounts[index].value.toLowerCase()),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
