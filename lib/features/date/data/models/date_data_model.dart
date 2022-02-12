class DateDataModel {
  final int year, month, day;

  DateDataModel({this.year, this.month, this.day});

  // DateDataModel.fromDateTime(DateTime dateTime)
  //     : month = dateTime.month,
  //       day = dateTime.day,
  //       year = dateTime.year;
}

abstract class EnglishMonthName {
  String get name;
}

abstract class ArabicMonthName {
  String get name;
}
