// To parse this JSON data, do
//
//     final skuResponse = skuResponseFromJson(jsonString);

import 'dart:convert';

SkuResponse skuResponseFromJson(String str) => SkuResponse.fromJson(json.decode(str));

String skuResponseToJson(SkuResponse data) => json.encode(data.toJson());

class SkuResponse {
  SkuResponse({
    required this.requestId,
    required this.at,
    required this.error,
    required this.data,
  });

  String requestId;
  String at;
  Error error;
  Data? data;

  factory SkuResponse.fromJson(Map<String, dynamic> json) => SkuResponse(
    requestId: json["requestId"],
    at: json["at"],
    error: Error.fromJson(json["error"]),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "requestId": requestId,
    "at": at,
    "error": error.toJson(),
    "data": data!.toJson(),
  };
}

class Data {


  String gameId;
  String userName;
  String session;
  String id;
  String cgUuid;
  String accessToken;
  String deviceId;

  Data(     this.gameId,
    this.userName,
   this.session,
    this.id,
    this.cgUuid,
    this.accessToken,
   this.deviceId,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
   json["gameId"],
    json["userName"],
    json["session"],
   json["id"],
    json["cgUuid"],
    json["accessToken"],
    json["deviceId"],
  );

  Map<String, dynamic> toJson() => {
    "gameId": gameId,
    "userName": userName,
    "session": session,
    "id": id,
    "cgUuid": cgUuid,
    "accessToken": accessToken,
    "deviceId": deviceId,
  };
}

class Error {
  Error({
   required this.code,
    required this.message,
  });

  int code;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}
