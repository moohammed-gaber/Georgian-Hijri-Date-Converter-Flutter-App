import 'package:flutter_date/features/date/data/models/date_data_model.dart';
import 'package:shamsi_date/shamsi_date.dart';

class JalaliDateDataModel extends DateDataModel {
  JalaliDateDataModel({int year, int month, int day})
      : super(year: year, day: day, month: month);
  factory JalaliDateDataModel.fromJalali(Jalali dateTime) =>
      JalaliDateDataModel(
          month: dateTime.month, day: dateTime.day, year: dateTime.year);
}
