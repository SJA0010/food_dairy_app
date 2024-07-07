// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_dairy_app/controller/loginController.dart';
import 'package:food_dairy_app/controller/recipe_repository.dart';
import 'package:food_dairy_app/model.dart/RecppeModel.dart';
import 'package:food_dairy_app/model.dart/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _dbase;

  static Future<Database?> get db async {
    if (_dbase != null) {
      return _dbase!;
    }
    _dbase = await initDatabase();
    return _dbase!;
  }

  static Future<Database> initDatabase() async {
    // deleteOldDatabase();
    print("Database created");
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'userDB.db');
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await createUsersTable(db, version);
      await createRecipesTable(db, version);
      await createBestRecipesTable(db, version);
    });
  }

  static Future<void> createUsersTable(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT,
      email TEXT,
      password TEXT,
      phone TEXT,
      dob TEXT,
      image TEXT
    )
  ''');
  }

  static Future<void> createRecipesTable(Database db, int version) async {
    await db.execute('''
    CREATE TABLE recipes (
      id TEXT PRIMARY KEY,
      name TEXT,
      description TEXT,
      imageUrl TEXT,
      calories TEXT,
      protein TEXT,
      prepTime TEXT
    )
  ''');
  }

  static Future<void> createBestRecipesTable(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Brecipes (
      id TEXT PRIMARY KEY,
      name TEXT,
      description TEXT,
      imageUrl TEXT,
      calories TEXT,
      protein TEXT,
      prepTime TEXT
    )
  ''');
  }

  static Future<void> deleteRecipesTable() async {
    initDatabase();
    try {
      print("delete the Recipe ");
      await _dbase!.delete("recipes");
    } catch (e) {
      print("errorrr rrr    $e");
    }
  }

  static Future<void> deleteUserTable() async {
    initDatabase();
    try {
      print("delete the users ");
      await _dbase!.delete("users");
    } catch (e) {
      print("errorrr rrr    $e");
    }
  }

  static Future<void> deleteOldDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'userDB.db');
    print("not deleted");
    await deleteUserTable();
    await deleteRecipesTable();

    if (await File(path).exists()) {
      await File(path).delete();
      print("Old database deleted");
    }
  }

  static Future<void> insertUser(UserModel user) async {
    final dbClient = await db;
    await dbClient!.insert('users', user.toMap());
  }

  static Future<void> insertRecipe(Recipe r) async {
    // await deleteOldDatabase();
    final dbClient = await db;
    await dbClient!.insert('recipes', r.toMap());
  }

  static Future<void> insertBRecipe(Recipe r) async {
    await deleteOldDatabase();
    final dbClient = await db;
    await dbClient!.insert('Brecipes', r.toMap());
  }

  static Future<void> updateUserById(int id, UserModel updatedUser) async {
    final dbClient = await db;
    await dbClient!.update(
      'users',
      updatedUser.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Recipe?>?> getAllBRecipes() async {
    try {
      final dbClient = await db;
      final List<Map<String, dynamic>> maps = await dbClient!.query('Brecipes');
      List<Recipe> recipe = List.generate(maps.length, (i) {
        return Recipe(
          id: maps[i]['id'],
          name: maps[i]['name'],
          description: maps[i]['description'],
          imageUrl: maps[i]['imageUrl'],
          calories: maps[i]['calories'],
          protein: maps[i]['protein'],
          prepTime: maps[i]['prepTime'],
        );
      });
      RecipeRepository.to.updatebestrecipe(recipe);
      return recipe;
    } catch (e) {
      print("errorrr     $e");
      return null;
    }
  }

  static Future<List<Recipe?>?> getAllRecipes() async {
    RecipeRepository.to.updateyourrecipe([]);

    try {
      final dbClient = await db;
      final List<Map<String, dynamic>> maps = await dbClient!.query('recipes');
      List<Recipe> recipe = List.generate(maps.length, (i) {
        return Recipe(
          id: maps[i]['id'],
          name: maps[i]['name'],
          description: maps[i]['description'],
          imageUrl: maps[i]['imageUrl'],
          calories: maps[i]['calories'],
          protein: maps[i]['protein'],
          prepTime: maps[i]['prepTime'],
        );
      });

      RecipeRepository.to.updateyourrecipe(recipe);
      return recipe;
    } catch (e) {
      print("errorrr     $e");
      return null;
    }
  }

  static Future<UserModel?> getUserByEmailAndPassword(
      String email, String password) async {
    final Database? database = await db;
    final List<Map<String, dynamic>> maps = await database!.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (maps.isEmpty) {
      print("dadada$maps");
      return null;
    }
    UserModel model = UserModel(
      id: maps[0]['id'].toString(),
      username: maps[0]['username'],
      email: maps[0]['email'],
      phone: maps[0]['phone'],
      password: maps[0]['password'],
      dob: maps[0]['dob'],
      image: maps[0]['image'],
    );
    print("sofjnsngfg$model");
    return model;
  }

  static Future<void> updateUser(
      UserModel user, String id, BuildContext context) async {
    try {
      final dbClient = await db;
      await dbClient!.update(
        'users',
        user.toMap(),
        where: 'id = ?',
        whereArgs: [id],
      );
      LoginController.to.UpdateUser(user.email, user.password, context);
      print('User updated successfully');
    } catch (e) {
      print('1234567890: $e');
    }
  }

  static Future<void> deleteUser(int id) async {
    final dbClient = await db;
    await dbClient!.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> close() async {
    final dbClient = await db;
    dbClient!.close();
  }
}
