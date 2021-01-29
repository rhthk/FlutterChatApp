class Contact{
  int id,number;
  String fname,lname,status,url;
  Contact(this.id,this.fname,this.lname,this.status,this.number,this.url);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fname': fname,
      'lname': lname,
      'status': status,
      'number': number,
      'imageUrl': url,
    };}
    @override
    String toString() {
      return 'Contact{id: $id, fname: $fname, lname: $lname, status: $status, number: $number}';
    }
}