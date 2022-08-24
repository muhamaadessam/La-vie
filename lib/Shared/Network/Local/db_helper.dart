import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  void createDatabase() async {
    var database = await openDatabase(
      'cart.db',
      version: 1,
      onCreate: (database, version) {
        database.execute('CREATE TABLE cart (id INTEGER PRIMARY KEY ,name TEXT ,price INTEGER ,productId INTEGER ,productQuantity INTEGER)').then((value) {
          debugPrint('table created');
        }).catchError((error) {
          debugPrint('error when creating ${error.toString()}');
        });
      },
    );
  }
}
