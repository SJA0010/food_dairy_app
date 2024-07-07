// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_dairy_app/controller/recipe_repository.dart';
import 'package:food_dairy_app/widget/constants/staticdata.dart';
import 'package:food_dairy_app/widget/loaded_recipes_widget.dart';
import 'package:get/get.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<RecipeRepository>(initState: (state) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {});
      });
    }, builder: (obj) {
      return SizedBox(
        height: height,
        width: width,
        child: Center(
          child: SizedBox(
            height: height,
            width: width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${StaticData.model!.username} 👋 ",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    CircleAvatar(
                        radius: 45,
                        // backgroundColor: Colors.blue.shade900,
                        backgroundImage:
                            FileImage(File(StaticData.model!.image)))
                  ],
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "${obj.bestrecipe == null ? 0 : obj.bestrecipe!.length} Best Food",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: obj.bestrecipe == null
                      ? const SizedBox()
                      : LoadedRecipesWidget(
                          recipes: obj.bestrecipe!,
                        ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
