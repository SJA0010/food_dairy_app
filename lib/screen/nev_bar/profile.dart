// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_dairy_app/controller/profileController.dart';
import 'package:food_dairy_app/widget/constants/staticdata.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    Get.put(ProfileController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<ProfileController>(builder: (obj) {
        return SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "Profile Update ",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: obj.image == null
                      ? FileImage(File(StaticData.model!.image))
                      : FileImage(
                          File(obj.image!.path),
                        ),
                  child: InkWell(
                    onTap: () {
                      obj.pickImage();
                    },
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  shadowColor: Colors.black,
                  // shape: CircleBorder(),
                  elevation: 10,
                  child: SizedBox(
                    height: 55,
                    width: 400,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 9),
                        child: TextField(
                          controller: obj.username,
                          cursorColor: Colors.black,
                          cursorHeight: 30,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Username",
                             filled: false,
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  shadowColor: Colors.black,
                  // shape: CircleBorder(),
                  elevation: 10,
                  child: SizedBox(
                    height: 55,
                    width: 400,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 9),
                        child: TextFormField(
                          controller: obj.password,
                          cursorColor: Colors.black,
                          cursorRadius: const Radius.circular(10),
                          cursorHeight: 30,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Password",
                            filled: false,
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  shadowColor: Colors.black,
                  // shape: CircleBorder(),
                  elevation: 10,
                  child: SizedBox(
                    height: 55,
                    width: 400,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 9),
                        child: TextFormField(
                          controller: obj.phone,
                          cursorColor: Colors.black,
                          cursorRadius: const Radius.circular(10),
                          cursorHeight: 30,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Phone",
                            filled: false,
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  shadowColor: Colors.black,
                  // shape: CircleBorder(),
                  elevation: 10,
                  child: SizedBox(
                    height: 55,
                    width: 400,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 9),
                        child: TextFormField(
                          controller: obj.dob,
                          cursorColor: Colors.black,
                          cursorRadius: const Radius.circular(10),
                          cursorHeight: 30,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Date of birth",
                            filled: false,
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  shadowColor: Colors.black,
                  // shape: CircleBorder(),
                  elevation: 10,
                  child: SizedBox(
                    height: 55,
                    width: 400,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 9),
                        child: TextFormField(
                          controller: obj.email,
                          cursorColor: Colors.black,
                          cursorRadius: const Radius.circular(10),
                          cursorHeight: 30,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Email",
                            filled: false,
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    obj.updatedata(context);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    shadowColor: Colors.black,
                    elevation: 10,
                    child: Container(
                      height: 55,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color.fromARGB(255, 138, 11, 160),
                      ),
                      child: const Center(
                        child: Text(
                          "Update",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
