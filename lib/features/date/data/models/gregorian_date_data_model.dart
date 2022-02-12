import 'package:flutter_date/core/constants/months.dart';
import 'package:flutter_date/features/date/data/models/date_data_model.dart';

class GregorianDateDataModel extends DateDataModel
    implements EnglishMonthName, ArabicMonthName {
  GregorianDateDataModel({int year, int month, int day})
      : super(year: year, day: day, month: month);

  factory GregorianDateDataModel.fromDateTime(DateTime dateTime) =>
      GregorianDateDataModel(
          month: dateTime.month, day: dateTime.day, year: dateTime.year);

  @override
  String get name => Months.months[month].gregorian.en;
}
