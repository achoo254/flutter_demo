// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

import 'Person.dart';

ResponseData responseDataFromJson(String str) => ResponseData.fromJson(json.decode(str));

String responseDataToJson(ResponseData data) => json.encode(data.toJson());

class ResponseData {
  ResponseData({
    required this.status,
    required this.message,
    required this.values,
  });

  final String status;
  final String message;
  final List<Value> values;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    status: json["status"],
    message: json["message"],
    values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "values": values,
  };
}

class Value {
  Value({
    required this.id,
    required this.data,
    required this.resourceId,
    required this.v,
  });

  final String id;
  final Data data;
  final String resourceId;
  final int v;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
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
