import 'package:flutter/material.dart';
import 'package:flutter_date/logic/date_converter.dart';
import 'package:hijri/umm_alqura_calendar.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeLogic {
  ThemeData themeData;
  TextTheme textTheme;
  DateTime nowGregorianDate;
  Jalali jalali;
  ummAlquraCalendar ummAlquraDate;
  HomeLogic() {
    nowGregorianDate = DateTime.now();
    ummAlquraDate = ummAlquraCalendar.now();
    jalali = Jalali.now();
  }
}
