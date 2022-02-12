import 'package:flutter_date/features/date/data/models/month_data_model.dart';

class Months {
  static final months = [
    Month(
        hijri: 'المحرم',
        jalali: 'الحمل',
        gregorian: Gregorian(ar: 'كانون الثاني', en: 'January')),
    Month(
        hijri: 'صفر',
        jalali: 'الثور',
        gregorian: Gregorian(ar: 'فبراير - شباط', en: 'February')),
    Month(
        hijri: 'ربيع الأول',
        jalali: 'الجوزاء',
        gregorian: Gregorian(ar: 'مارس - آذار', en: 'March')),
    Month(
        hijri: 'ربيع الثانى',
        jalali: 'السرطان',
        gregorian: Gregorian(ar: 'نيسان', en: 'April')),
    Month(
        hijri: 'جمادى الأولى',
        jalali: 'الاسد',
        gregorian: Gregorian(ar: 'مايو - أيار', en: 'May')),
    Month(
        hijri: 'جمادى الآخرة',
        jalali: 'السنبلة',
        gregorian: Gregorian(ar: 'يونيو - حزيران', en: 'June')),
    Month(
        hijri: 'رجب',
        jalali: 'الميزان',
        gregorian: Gregorian(ar: 'يوليو - تموز', en: 'July')),
    Month(
        hijri: 'شعبان',
        jalali: 'العقرب',
        gregorian: Gregorian(ar: 'أغسطس - آب', en: 'August')),
    Month(
        hijri: 'رمضان',
        jalali: 'القوس',
        gregorian: Gregorian(ar: 'سبتمبر - أيلول', en: 'September')),
    Month(
        hijri: 'شوال',
        jalali: 'الجدي',
        gregorian: Gregorian(ar: 'أكتوبر - تشرين الأول', en: 'October')),
    Month(
        hijri: 'ذو القعدة',
        jalali: 'الدلو',
        gregorian: Gregorian(ar: 'نوفمبر - تشرين الثانى', en: 'November')),
    Month(
        hijri: 'ذو الحجة',
        jalali: 'الحوت',
        gregorian: Gregorian(ar: 'ديسمبر كانون الأول', en: 'December')),
  ];
}
