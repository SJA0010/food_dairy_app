import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_dairy_app/controller/recipe_repository.dart';
import 'package:get/get.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  void initState() {
    Get.put(RecipeRepository());
    super.initState();
  }

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<RecipeRepository>(builder: (obj) {
      return Scaffold(
        body: ListView(children: [
          SizedBox(height: height * 0.05),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                SizedBox(width: width * 0.02),
                const Icon(
                  Icons.west,
                  color: Colors.white,
                  size: 35,
                ),
                SizedBox(width: width * 0.25),
                const Text(
                  "Add Food ",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: obj.image != null
                ? CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(
                      File(obj.image!.path),
                    ),
                    child: InkWell(
                      onTap: () {
                        obj.pickImage();
                      },
                      child: const Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: 80,
                    child: InkWell(
                      onTap: () {
                        obj.pickImage();
                      },
                      child: const Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              height: 55,
              width: 400,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 9),
                  child: TextField(
                    enableInteractiveSelection: false,
                    controller: obj.name,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(10),
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      filled: false,
                      border: InputBorder.none,
                      hintText: "  Name",
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            shadowColor: Colors.black,
            elevation: 10,
            child: SizedBox(
              height: 55,
              width: 400,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 9),
                  child: TextFormField(
                    controller: obj.des,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(10),
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      hintText: "  Description",
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
                    controller: obj.cal,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(10),
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "  Calories",
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
                    controller: obj.protein,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(10),
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      hintText: "  Protein",
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
                    controller: obj.pre,
                    cursorColor: Colors.black,
                    cursorRadius: const Radius.circular(10),
                    cursorHeight: 30,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "  PrepTime",
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
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                obj.addRecipe(context);
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
                      "Add",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ]),
      );
    });
  }
}
