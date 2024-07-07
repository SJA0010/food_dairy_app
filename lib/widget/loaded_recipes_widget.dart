// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:food_dairy_app/model.dart/RecppeModel.dart';
import 'package:food_dairy_app/screen/recipe_details_screen.dart';

class LoadedRecipesWidget extends StatefulWidget {
  final List<Recipe> recipes;
  final bool? delete;
  const LoadedRecipesWidget({
    super.key,
    required this.recipes,
    this.delete,
  });

  @override
  State<LoadedRecipesWidget> createState() => _LoadedRecipesWidgetState();
}

class _LoadedRecipesWidgetState extends State<LoadedRecipesWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.recipes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailsScreen(
                  delete: widget.delete,
                  recipe: widget.recipes[index],
                ),
              ),
            );
          },
          child: RecipeCardWidget(
            recipe: widget.recipes[index],
          ),
        );
      },
    );
  }
}

class RecipeCardWidget extends StatelessWidget {
  final Recipe recipe;
  RecipeCardWidget({
    super.key,
    required this.recipe,
  });

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.24,
      width: width,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedImageWidget(
              imageUrl: recipe.imageUrl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${recipe.calories}cal \t\t\t\t${recipe.protein}protein",
                    style: Theme.of(context).textTheme.labelMedium),
                SizedBox(
                    width: width * 0.4,
                    child: Text(recipe.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: true,
                        style: Theme.of(context).textTheme.titleLarge)),
                SizedBox(
                  width: width * 0.4,
                  child: Text(recipe.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      softWrap: true,
                      style: Theme.of(context).textTheme.labelLarge),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AnimatedImageWidget extends StatelessWidget {
  final String imageUrl;
  AnimatedImageWidget({
    super.key,
    required this.imageUrl,
  });

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print("data786786      $imageUrl");
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: FileImage(
                File(
                  imageUrl,
                ),
              ),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            )),
        height: height * 0.15,
        width: width * 0.3,

        //  Image.asset(
        //   imageUrl,
        //   fit: BoxFit.contain,
        //   alignment: Alignment.center,
        // ),
      ),
    );
  }
}
