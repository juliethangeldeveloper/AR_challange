import 'package:codechallange/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

class DatabaseHelper{
  static Database _db;


  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "userData.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }


void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Traveler(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, username TEXT, password TEXT, dob TEXT, email TEXT)");
    print("Created tables");
  }


void saveTraveler(User user) async {
    print("Inserted user");
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Traveler(firstname, lastname, username, password, dob, email) VALUES(' +
              '\'' +
              user.firstName +
              '\'' +
              ',' +
              '\'' +
              user.lastName +
              '\'' +
              ',' +
              '\'' +
              user.userName +
              '\'' +
              ',' +
              '\'' +
              user.password +
              '\'' +
              ',' +
              '\'' +
              user.dob +
              '\'' +
              ',' +
              '\'' +
              user.email +
              '\'' +
              ')');
    });
}

Future<List<User>> getUsers() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Traveler');
    List<User> usersInfo = new List<User>();
    for (int i = 0; i < list.length; i++) {
      User user = new User();
      user.firstName = list[i]["firstname"];
      user.lastName = list[i]["lastname"];
      user.userName = list[i]["username"];
      user.password = list[i]["password"];
      user.dob = list[i]["dob"];
      user.email = list[i]["email"];
   

      usersInfo.add(user);
    }

    return usersInfo;
  }

  void deleteTraveler(User user) async {
    var dbClient = await db;
    await dbClient.delete('Traveler',
        where: "email = ?", whereArgs: [user.email]);
  }


}