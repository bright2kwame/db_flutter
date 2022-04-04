import 'package:db_test/user.dart';
import 'package:sqflite/sqflite.dart';

class DBOperations {
  final Database _database;

  DBOperations(this._database);

  Future<void> insertRecord(String firstName, String lastName) async {
    Map<String, Object> userMap = {
      "id": DateTime.now().millisecond,
      "first_name": firstName,
      "last_name": lastName
    };

    await _database.insert(
      'users',
      userMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> users() async {
    final List<Map<String, dynamic>> maps = await _database.query('users');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        first_name: maps[i]['first_name'],
        last_name: maps[i]['last_name'],
      );
    });
  }
}
