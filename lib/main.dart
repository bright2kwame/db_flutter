import 'package:db_test/app_database.dart';
import 'package:db_test/db_operations.dart';
import 'package:db_test/my_app.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = await AppDatabase().initDB();
  DBOperations(db).insertRecord("Hello", "More");

  runApp(const MyApp());
}
