import 'package:flutterapp/Database/contacts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  Future<void> createDB() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive
        ..init(appDocDir.path)
        ..registerAdapter(ContactHiveAdapter());
    var contactBox = await Hive.openBox('contacts');
  }
}