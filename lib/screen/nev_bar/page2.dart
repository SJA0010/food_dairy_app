// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
// import 'package:food_dairy_app/model.dart/RecppeModel.dart';
import 'package:food_dairy_app/controller/recipe_repository.dart';
import 'package:food_dairy_app/widget/loaded_recipes_widget.dart';
import 'package:get/get.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<RecipeRepository>(
        initState: (state) {},
        builder: (obj) {
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
                    Text(
                      "Eaten Food ",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Expanded(
                      child: obj.yourrecipe == null
                          ? const SizedBox()
                          : LoadedRecipesWidget(
                              delete: true,
                              recipes: obj.yourrecipe!,
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
