import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class HijriToDateTimeMapper {
  final HijriCalendar hijri;

  HijriToDateTimeMapper(this.hijri);

  DateTime get toDateTime => DateTime(
        hijri.hYear,
        hijri.hMonth,
        hijri.hDay,
      );
}
