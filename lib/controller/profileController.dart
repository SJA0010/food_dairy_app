import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_dairy_app/controller/sqllite.dart';
import 'package:food_dairy_app/model.dart/UserModel.dart';
import 'package:food_dairy_app/screen/home_screen.dart';
import 'package:food_dairy_app/widget/constants/staticdata.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  TextEditingController username =
      TextEditingController(text: StaticData.model!.username);
  TextEditingController email =
      TextEditingController(text: StaticData.model!.email);
  TextEditingController password =
      TextEditingController(text: StaticData.model!.password);
  TextEditingController phone =
      TextEditingController(text: StaticData.model!.phone);
  TextEditingController dob =
      TextEditingController(text: StaticData.model!.dob);
  File? image;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      update();
    }
  }

  updatedata(context) async {
    image ??= await StaticData.assetToFile(StaticData.model!.image);
    if (username.text.isNotEmpty &&
        email.text.isNotEmpty &&
        image != null &&
        password.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        dob.text.isNotEmpty) {
      UserModel model = UserModel(
        password: password.text,
        image: image!.path,
        username: username.text,
        id: StaticData.model!.id,
        email: email.text,
        phone: phone.text,
        dob: dob.text,
      );
      print("asdfgh $model");
      await DBHelper.updateUser(model, model.id, context);

      // StaticData.model = model;
      // StaticData.id = id;
      update();
      Fluttertoast.showToast(
        msg: "Update data Successfuly !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => true,
      );

      clearField();
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
  }

  void clearField() {
    username.clear();
    email.clear();
    password.clear();
    phone.clear();
    dob.clear();
    image = null;
    update();
  }
}
