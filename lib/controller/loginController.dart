// ignore_for_file: file_names, avoid_print

import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_dairy_app/controller/sqllite.dart';
import 'package:food_dairy_app/widget/constants/staticdata.dart';
import 'package:food_dairy_app/model.dart/UserModel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<bool> getUser(String email, String password) async {
    print("dataaaa");
    UserModel? model = await DBHelper.getUserByEmailAndPassword(
      email,
      password,
    );

    if (model != null) {
      print("dskjfhj$model");
      StaticData.model = model;
      StaticData.id = model.id;
      update();
      StaticData.storeCredentials(email, password);
      cleardata();
      return true;
    } else {
      Fluttertoast.showToast(
        msg: "User not found !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );

      print("kjsdhfjkshdf");
      return false;
    }
  }

  cleardata() {
    email.clear();
    password.clear();
    update();
  }

  Future<UserModel?> UpdateUser(String email, String password, context) async {
    print("dataaaa");
    UserModel? model =
        await DBHelper.getUserByEmailAndPassword(email, password);

    if (model != null) {
      print("dskjfhj$model");
      StaticData.model = model;
      StaticData.id = model.id;
      update();
    } else {
      print("kjsdhfjkshdf");
      return null;
    }
    return null;
  }
}
