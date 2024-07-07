// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_dairy_app/controller/signupController.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    Get.put(SignupController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<SignupController>(initState: (state) {
        Get.put(SignupController());
      }, builder: (obj) {
        return Container(
            height: height,
            width: width,
            color: Colors.black,
            child: ListView(children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 22),
                    child: Icon(
                      Icons.west,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 100),
                      child: Text(
                        "Sign up free account",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
                              controller: obj.username,
                              cursorColor: Colors.black,
                              cursorRadius: const Radius.circular(10),
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
                        obj.register(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        shadowColor: Colors.black,
                        elevation: 10,
                        child: Container(
                          height: 55,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color.fromARGB(255, 138, 11, 160),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Column(
                      children: [
                        Text(
                          "By clicking Sign up you agree to the",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              " following ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Text(
                              "terms and Conditions",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 241, 21, 5)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ]));
      }),
    );
  }
}
