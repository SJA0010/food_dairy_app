// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_typing_uninitialized_variables
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_dairy_app/controller/recipe_repository.dart';

import 'package:food_dairy_app/model.dart/RecppeModel.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final Recipe recipe;
  bool? delete;
  RecipeDetailsScreen({
    super.key,
    required this.recipe,
    this.delete,
  });

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 25,
                ),
              ),
              Text(
                widget.recipe.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.not_accessible,
                    size: 25,
                  ))
            ]),
            SizedBox(
              height: height * 0.04,
            ),
            Center(
              child: Container(
                height: height * 0.25,
                width: width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    image: DecorationImage(
                      image: FileImage(
                        File(
                          widget.recipe.imageUrl,
                        ),
                      ),
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                    )),
                alignment: Alignment.center,
                // child: Image.asset(

                //   fit: BoxFit.contain,
                // )),
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Container(
              width: width,
              height: height * 0.1,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white30, width: 1.3),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoViewer(name: 'Kcal', amount: widget.recipe.calories),
                    InfoViewer(name: 'Protein', amount: widget.recipe.protein),
                    InfoViewer(
                        name: 'Prep Time', amount: widget.recipe.prepTime),
                  ]),
            ),
            SizedBox(height: height * 0.05),
            Text(
              "Description",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
            Flexible(
              child: Text(
                widget.recipe.description,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: height * 0.02),
            InkWell(
              onTap: () {
                if (widget.delete == true) {
                  RecipeRepository.to.delete(widget.recipe);
                  Navigator.pop(context);
                }
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                shadowColor: Colors.black,
                elevation: 10,
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(255, 138, 11, 160),
                  ),
                  child: Center(
                    child: Text(
                      widget.delete == true ? "Delete" : "Update",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoViewer extends StatelessWidget {
  final String name;
  final String amount;
  const InfoViewer({
    super.key,
    required this.name,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          amount.toString(),
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 18,
              ),
        ),
        Text(name, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
