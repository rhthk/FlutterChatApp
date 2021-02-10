class Contact {
  int id, number;
  bool isOnline;
  String firstName, lastName, status, url, lastActive;
  // Map<String,String> name ;
  Contact(this.id, this.firstName, this.lastName, this.status, this.number,
      this.url, this.lastActive, this.isOnline);

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        1,
        json['name']['firstName'],
        json['name']['lastName'],
        json['status'],
        json['number'],
        json['url']==""?"https://picsum.photos/600":json['url'],
        json['lastActive'],
        json['isOnline']);
  }
}
