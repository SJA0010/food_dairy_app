// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_dairy_app/controller/sqllite.dart';
import 'package:food_dairy_app/screen/loginScreen.dart';
import 'package:get/get.dart';
import 'package:food_dairy_app/model.dart/UserModel.dart';
import 'package:food_dairy_app/widget/constants/staticdata.dart';

class SignupController extends GetxController {
  static SignupController get to => Get.find();

  TextEditingController username = TextEditingController();
  TextEditingController email =
      TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();

  late final DBHelper database;

  @override
  void onInit() {
    _initializeDatabase();
    super.onInit();
  }

  Future<void> _initializeDatabase() async {
    database = DBHelper();
    await DBHelper.initDatabase();
  }

  Future<void> register(BuildContext context) async {
    await DBHelper.initDatabase();
    // try {
    if (username.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        dob.text.isNotEmpty) {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      UserModel model = UserModel(
        password: password.text,
        image: await StaticData.assetToF("assets/images/download.png"),
        username: username.text,
        id: id,
        email: email.text,
        phone: phone.text,
        dob: dob.text,
      );

      await DBHelper.insertUser(
        model,
      );

      StaticData.model = model;
      StaticData.id = id;
      update();
      clearField();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Please fill all fields!",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
    // } catch (e) {
    //   print("Error in registration: $e");
    //   Fluttertoast.showToast(
    //     msg: "An error occurred. Please try again later!",
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     gravity: ToastGravity.BOTTOM,
    //     fontSize: 17,
    //     timeInSecForIosWeb: 1,
    //     toastLength: Toast.LENGTH_LONG,
    //   );
    // }
  }

  void clearField() {
    username.clear();
    email.clear();
    password.clear();
    phone.clear();
    dob.clear();
  }
}
