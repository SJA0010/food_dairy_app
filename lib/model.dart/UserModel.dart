// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'dart:convert';

class UserModel {
  String username;
  String id;

  String email;
  String phone;
  String dob;
  String image;
  String password;
  UserModel({
    required this.username,
    required this.id,
    required this.email,
    required this.phone,
    required this.dob,
    required this.image,
    required this.password,
  });

  UserModel copyWith({
    String? username,
    String? id,
    String? email,
    String? phone,
    String? dob,
    String? image,
    String? password,
  }) {
    return UserModel(
      username: username ?? this.username,
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      image: image ?? this.image,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'id': id,
      'email': email,
      'phone': phone,
      'dob': dob,
      'image': image,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      id: map['id'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      dob: map['dob'] as String,
      image: map['image'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(username: $username, id: $id, email: $email, phone: $phone, dob: $dob, image: $image, password: $password)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.id == id &&
        other.email == email &&
        other.phone == phone &&
        other.dob == dob &&
        other.image == image &&
        other.password == password;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        id.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        dob.hashCode ^
        image.hashCode ^
        password.hashCode;
  }
}
