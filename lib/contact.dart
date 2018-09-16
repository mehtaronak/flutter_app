import 'phone.dart';

class Contact {
  String id;
  String name;
  String email;
  String address;
  String gender;
  Phone phone;

  Contact(
      {this.id, this.name, this.email, this.address, this.gender, this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return new Contact(
      id: json['id'],
      name: json['name'],
    );
  }
}
