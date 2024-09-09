// To parse this JSON data, do
//
//     final appareilModel = appareilModelFromJson(jsonString);

import 'dart:convert';

AppareilModel appareilModelFromJson(String str) => AppareilModel.fromJson(json.decode(str));

String appareilModelToJson(AppareilModel data) => json.encode(data.toJson());

class AppareilModel {
  String? ssid;
  String? rssi;
  String? isSecure;

  AppareilModel({
    this.ssid,
    this.rssi,
    this.isSecure,
  });

  factory AppareilModel.fromJson(Map<String, dynamic> json) => AppareilModel(
    ssid: json["ssid"],
    rssi: json["rssi"],
    isSecure: json["isSecure"],
  );

  Map<String, dynamic> toJson() => {
    "ssid": ssid,
    "rssi": rssi,
    "isSecure": isSecure,
  };
}
