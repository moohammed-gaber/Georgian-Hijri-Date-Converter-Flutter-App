import 'package:flutter_date/features/date/data/models/date_data_model.dart';
import 'package:hijri/hijri_calendar.dart';

class HijriDateDataModel extends DateDataModel {
  HijriDateDataModel({int year, int month, int day})
      : super(year: year, day: day, month: month);

  factory HijriDateDataModel.fromHijriCalendar(HijriCalendar dateTime) =>
      HijriDateDataModel(
          month: dateTime.hMonth, day: dateTime.hDay, year: dateTime.hYear);
}
