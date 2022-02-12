import 'package:flutter_date/features/date/data/models/gregorian_date_data_model.dart';
import 'package:flutter_date/features/date/data/models/hijri_date_data_model.dart';
import 'package:flutter_date/features/date/data/models/jalili_date_data_model.dart';

abstract class IDateDataSource {
  JalaliDateDataModel getNowJalaliDate();

  GregorianDateDataModel getNowGregorianDate();

  HijriDateDataModel getNowHijriDate();
}
