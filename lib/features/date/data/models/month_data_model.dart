// To parse this JSON data, do
//
//     final month = monthFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Month> monthFromJson(String str) =>
    List<Month>.from(json.decode(str).map((x) => Month.fromJson(x)));

String monthToJson(List<Month> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Month {
  Month({
    @required this.hijri,
    @required this.jalali,
    @required this.gregorian,
  });

  final String hijri;
  final String jalali;
  final Gregorian gregorian;

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        hijri: json["hijri"],
        jalali: json["jalali"],
        gregorian: Gregorian.fromJson(json["gregorian"]),
      );

  Map<String, dynamic> toJson() => {
        "hijri": hijri,
        "jalali": jalali,
        "gregorian": gregorian.toJson(),
      };
}

class Gregorian {
  Gregorian({
    @required this.ar,
    @required this.en,
  });

  final String ar;
  final String en;

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}
