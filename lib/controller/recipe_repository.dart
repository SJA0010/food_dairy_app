import 'dart:io';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_dairy_app/controller/sqllite.dart';
import 'package:food_dairy_app/model.dart/RecppeModel.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RecipeRepository extends GetxController {
  static RecipeRepository get to => Get.find();
  List<Recipe>? yourrecipe;
  List<Recipe>? bestrecipe;
  TextEditingController name = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController cal = TextEditingController();
  TextEditingController protein = TextEditingController();
  TextEditingController pre = TextEditingController();
  int index = 0;
  File? image;
  void delete(Recipe recipe) {
    yourrecipe!.removeWhere((item) => item.id == recipe.id);
    update();
  }

  updatebestrecipe(List<Recipe> recipe) {
    bestrecipe = recipe;
    update();
  }

  updateyourrecipe(List<Recipe> recipe) {
    yourrecipe = recipe;
    update();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      update();
    }
  }

  Future<void> addRecipe(context) async {
    if (name.text.isNotEmpty &&
        des.text.isNotEmpty &&
        image != null &&
        cal.text.isNotEmpty &&
        protein.text.isNotEmpty &&
        pre.text.isNotEmpty) {
      String id = DateTime.now().microsecond.toString();
      Recipe model = Recipe(
          id: id,
          name: name.text,
          description: des.text,
          imageUrl: image!.path,
          calories: cal.text,
          protein: protein.text,
          prepTime: pre.text);
      DBHelper.insertRecipe(model).then((value) {
        Fluttertoast.showToast(
          msg: "Add Successfully !",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
        DBHelper.getAllRecipes();
      });
      cleardata();
    } else {
      Fluttertoast.showToast(
        msg: "Fill All Fields! !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  cleardata() {
    name.clear();
    des.clear();
    des.clear();
    image = null;
    cal.clear();
    pre.clear();
    protein.clear();
    update();
  }
}





// import 'dart:convert';

// import 'package:dribbble_challenge/src/recipes/domain/recipe.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class RecipeRepository {
//   Future<List<Recipe>> loadRecipes(
//       {String filePath = "assets/recipes.json"}) async {
//     final response = await rootBundle.loadString(filePath);
//     final recipes =
//         (jsonDecode(response) as List).map((e) => Recipe.fromJson(e)).toList();
//     return recipes;
//   }
// }

// final repositoryProvider = Provider<RecipeRepository>((ref) {
//   return RecipeRepository();
// });

// final recipesProvider = FutureProvider<List<Recipe>>((ref) async {
//   return ref.watch(repositoryProvider).loadRecipes();
// });
