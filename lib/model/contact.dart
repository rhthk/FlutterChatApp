import 'package:flutter/cupertino.dart';

class Contact{
  int id,number;
  String fname,lname,status;
  Contact(this.id,this.fname,this.lname,this.status,this.number);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fname': fname,
      'lname': lname,
      'status': status,
      'number': number,
    };}
    @override
    String toString() {
      return 'Contact{id: $id, fname: $fname, lname: $lname, status: $status, number: $number}';
    }
}