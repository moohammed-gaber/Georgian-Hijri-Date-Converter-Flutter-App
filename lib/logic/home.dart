import 'package:flutter/material.dart';
import 'package:hijri/umm_alqura_calendar.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeLogic {
  ThemeData themeData;
  TextTheme textTheme;
  var offWhite = Color(0xffE2D5E5);
  var white = Colors.white;
  var orange = Color(0xffEBB944);
  DateTime nowGregorianDate;
  Jalali jalali;
  ummAlquraCalendar ummAlquraDate;
  HomeLogic() {
    nowGregorianDate = DateTime.now();
    ummAlquraDate = ummAlquraCalendar.now();
    jalali = Jalali.now();
    print('iam here');
  }
}
