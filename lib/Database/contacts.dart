import 'package:hive/hive.dart';
part 'contacts.g.dart';

@HiveType(typeId: 1)
class ContactHive{
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;
  @HiveField(2)
  String status;
  @HiveField(3)
  int number;
  @HiveField(4)
  String url;
  @HiveField(5)
  String lastAvtive;

}