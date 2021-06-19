import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date/logic/date_converter.dart';
import 'package:hijri/digits_converter.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeLogic {
  ThemeData themeData;
  TextTheme textTheme;
  DateTime nowGregorianDate;
  Jalali jalali;
  HijriCalendar ummAlquraDate;
  HomeLogic() {
    nowGregorianDate = DateTime.now();
    ummAlquraDate = HijriCalendar.now();
    jalali = Jalali.now();
    bannerAd = createBannerAd();
    bannerAd.load();
  }
  BannerAd bannerAd;


  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (event) {
          if (MobileAdEvent.loaded == event) {
            bannerAd.show();
          }
          if(event==MobileAdEvent.failedToLoad){
            bannerAd.load();
          }
        });
  }
}
