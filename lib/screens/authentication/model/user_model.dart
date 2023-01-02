import 'dart:convert';

class User {
  final String id;
  final String email;
  final String name;
  final String password;
  final String address;
  final String identity;
  final String token;
  final String phone;
  // final List<dynamic> cart;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.address,
      required this.identity,
      required this.token,
      required this.phone
      // required this.cart,
      });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['_id'] ?? '',
        name: map['name'] ?? '',
        password: map['password'] ?? '',
        address: map['address'] ?? '',
        identity: map['identity'] ?? '',
        token: map['token'] ?? '',
        email: map['email'] ?? '',
        phone: map['phone'] ?? ''
        // cart: List<Map<String, dynamic>>.from(
        //   map['cart']?.map(
        //     (x) => Map<String, dynamic>.from(x),
        //   ),
        // ),
        );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['address'] = address;
    data['identity'] = identity;
    data['id'] = id;
    data['token'] = token;
    data['phone'] = phone;
    // data['cart'] = cart;
    return data;
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String src) => User.fromMap(json.decode(src));

//   User copyWith({
//     String? id,
//     String? email,
//     String? name,
//     String? password,
//     String? address,
//     String? type,
//     String? token,
//     List<dynamic>? cart,
//   }) {
//     return User(
//       id: id ?? this.id,
//       email: email ?? this.email,
//       name: name ?? this.name,
//       password: password ?? this.password,
//       address: address ?? this.address,
//       type: type ?? this.type,
//       token: token ?? this.token,
//       cart: cart ?? this.cart,
//     );
//   }
}
