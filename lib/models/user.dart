import 'package:muathin/models/address.dart';

class User {
  String userID, name, email, phone, role;
  List<Address> addresses = [];
  var createdAt;

  User transform({String key, Map map}) {
    User user = new User();
    List<dynamic> addresses = map['addresses'];

    user.userID = key;
    user.name = map['name'];
    user.email = map['email'];
    user.phone = map['phone'];
    user.role = map['role'];

    addresses.forEach((address) {
      user.addresses.add(Address().transform(map: address));
    });

    user.createdAt = map['createdAt'];

    return user;
  }
}