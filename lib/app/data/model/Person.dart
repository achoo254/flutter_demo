// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  Person({
    required this.id,
    required this.data,
    required this.resourceId,
    required this.v,
  });

  final String id;
  final Data data;
  final String resourceId;
  final int v;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["_id"],
    data: Data.fromJson(json["data"]),
    resourceId: json["resourceId"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "data": data.toJson(),
    "resourceId": resourceId,
    "__v": v,
  };
}

class Data {
  Data({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  final String username;
  final String firstName;
  final String lastName;
  final String password;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "password": password,
  };
}
