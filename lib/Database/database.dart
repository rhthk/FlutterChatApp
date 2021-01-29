// import 'dart:async';
// import 'package:flutter/widgets.dart';
// import 'package:flutterapp/model/contact.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
//
//   void getdb() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     final Future<Database> database = openDatabase(
//       join(await getDatabasesPath(), 'chat.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE CONTACTS(id INTEGER PRIMARY KEY, fname TEXT, lname TEXT, status TEXT, number INTEGER)",
//         );
//       },
//       version: 1,
//     );
//
//     Future<void> insertContact(Contact contact) async {
//       // Get a reference to the database.
//       final Database db = await database;
//
//       // Insert the Contact into the correct table. Also specify the
//       // `conflictAlgorithm`. In this case, if the same Contact is inserted
//       // multiple times, it replaces the previous data.
//       await db.insert(
//         'contacts',
//         contact.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//
//     Future<List<Contact>> contacts() async {
//       // Get a reference to the database.
//       final Database db = await database;
//
//       // Query the table for all The Contacts.
//       final List<Map<String, dynamic>> maps = await db.query('contacts');
//
//       // Convert the List<Map<String, dynamic> into a List<Contact>.
//       return List.generate(maps.length, (i) {
//         return Contact(maps[i]['id'], maps[i]['fname'], maps[i]['lname'],
//             maps[i]['age'], maps[i]['number']);
//       });
//     }
//
//     Future<void> updateContact(Contact contact) async {
//       // Get a reference to the database.
//       final db = await database;
//
//       // Update the given Contact.
//       await db.update(
//         'contacts',
//         contact.toMap(),
//         // Ensure that the Contact has a matching id.
//         where: "id = ?",
//         // Pass the Contact's id as a whereArg to prevent SQL injection.
//         whereArgs: [contact.id],
//       );
//     }
//
//     Future<void> deleteContact(int id) async {
//       // Get a reference to the database.
//       final db = await database;
//
//       // Remove the Contact from the database.
//       await db.delete(
//         'contacts',
//         // Use a `where` clause to delete a specific contact.
//         where: "id = ?",
//         // Pass the Contact's id as a whereArg to prevent SQL injection.
//         whereArgs: [id],
//       );
//     }
//
//     var fido = new Contact(0, "abc", "bca", "huhu", 10);
//
//     // Insert a contact into the database.
//     await insertContact(fido);
//
//     // Print the list of contacts (only Fido for now).
//     print(await contacts());
//
//     // Update Fido's age and save it to the database.
//     fido = Contact(
//         fido.id, fido.fname, fido.lname, fido.status, (fido.number + 7));
//     await updateContact(fido);
//
//     // Print Fido's updated information.
//     print(await contacts());
//
//     // Delete Fido from the database.
//     await deleteContact(fido.id);
//
//     // Print the list of Contacts (empty).
//     print(await contacts());
//   }
