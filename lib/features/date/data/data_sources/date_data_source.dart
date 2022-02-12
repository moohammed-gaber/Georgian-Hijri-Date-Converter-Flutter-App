import 'package:flutter_date/features/date/data/mappers/hijri_to_date_time_mapper.dart';
import 'package:flutter_date/features/date/data/models/gregorian_date_data_model.dart';
import 'package:flutter_date/features/date/data/models/hijri_date_data_model.dart';
import 'package:flutter_date/features/date/data/models/jalili_date_data_model.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:shamsi_date/shamsi_date.dart';

import 'i_date_data_source.dart';

class DateDataSource implements IDateDataSource {
  @override
  JalaliDateDataModel getNowJalaliDate() {
    return JalaliDateDataModel.fromJalali(Jalali.now());
  }

  @override
  GregorianDateDataModel getNowGregorianDate() {
    return GregorianDateDataModel.fromDateTime(DateTime.now());
  }

  @override
  HijriDateDataModel getNowHijriDate() {
    return HijriDateDataModel.fromHijriCalendar(HijriCalendar.now());
  }
}
