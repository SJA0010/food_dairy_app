// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_dairy_app/controller/loginController.dart';
import 'package:food_dairy_app/controller/recipe_repository.dart';
import 'package:food_dairy_app/model.dart/RecppeModel.dart';
import 'package:food_dairy_app/screen/SignupScreen.dart';
import 'package:food_dairy_app/screen/home_screen.dart';
import 'package:food_dairy_app/widget/constants/staticdata.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Get.put(LoginController());
    Get.put(RecipeRepository());

    StaticData.retrieveCredentials(context);
    getdata();
    super.initState();
  }

  getdata() async {
    RecipeRepository.to.bestrecipe = await loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (obj) {
        return Container(
          height: height,
          width: width,
          color: Colors.black,
          child: Center(
            child: SizedBox(
              height: height,
              width: width * 0.9,
              child: ListView(
                children: [
                  Container(
                    height: 390,
                    width: width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/dish.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                        const Text(
                          "Login to your account",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          shadowColor: Colors.black,
                          // shape: CircleBorder(),
                          elevation: 10,
                          child: SizedBox(
                            height: 60,
                            width: 400,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 9),
                                child: TextFormField(
                                  controller: obj.email,
                                  cursorColor: Colors.black,
                                  cursorRadius: const Radius.circular(10),
                                  cursorHeight: 30,
                                  style: const TextStyle(fontSize: 20),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    filled: false,
                                    hintText: "  Email",
                                    hintStyle: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          shadowColor: Colors.black,
                          // shape: CircleBorder(),
                          elevation: 10,
                          child: SizedBox(
                            height: 60,
                            width: 400,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 9),
                                child: TextFormField(
                                  controller: obj.password,
                                  cursorColor: Colors.black,
                                  cursorRadius: const Radius.circular(10),
                                  cursorHeight: 30,
                                  style: const TextStyle(fontSize: 20),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    filled: false,
                                    hintText: "  Password",
                                    hintStyle: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Forget your password?",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            obj
                                .getUser(
                              obj.email.text,
                              obj.password.text,
                            )
                                .then((value) {
                              if (value) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                  (route) => true,
                                );
                              } else {}
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            shadowColor: Colors.black,
                            // shape: CircleBorder(),
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
                                  "Login",
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
                          height: 15,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Don't have account?",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUp(),
                                    ));
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
