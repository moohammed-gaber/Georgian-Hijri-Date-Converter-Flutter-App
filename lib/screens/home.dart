import 'package:flutter/material.dart';
import 'package:flutter_date/logic/date_converter.dart';
import 'package:flutter_date/logic/home.dart';
import 'package:flutter_date/util/data.dart';
import 'package:flutter_date/util/screen.dart';
import 'package:flutter_date/widgets/button.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    HomeLogic homeLogic = Provider.of<HomeLogic>(context);
    Screen screen = Provider.of<Screen>(context);
    print(homeLogic.textTheme.display2.color);
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    print('hello worlddddddddddddd');
    DateConverterLogic dateConverterLogic =
        Provider.of<DateConverterLogic>(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: screen.height,
              width: screen.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xff22033C),
                    Color(0xffD16696),
                    Color(0xffBD63A7)
                  ])),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Flexible(
                  flex: 28,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white12,
                      ),
                      child: Column(
                        children: <Widget>[
                          Flexible(
                            child: Container(),
                            flex: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                Data.months[homeLogic.ummAlquraDate.hMonth]
                                    ['ummAlqura'],
                                style: homeLogic.textTheme.body2,
                              ),
                              Text(
                                Data.weekDays[
                                    homeLogic.nowGregorianDate.weekday]['ar'],
                                style: homeLogic.textTheme.body2
                                    .copyWith(color: Colors.orange),
                              ),
                            ],
                          ),
                          Text(
                              '${homeLogic.ummAlquraDate.hYear} / ${homeLogic.ummAlquraDate.hMonth} / ${homeLogic.ummAlquraDate.hDay}',
                              style: homeLogic.textTheme.display2),
                          Text(
                            '${homeLogic.jalali.day} ${Data.months[homeLogic.jalali.month]['jalali']} ${homeLogic.jalali.year} ',
                            style: homeLogic.textTheme.body1
                                .copyWith(color: Colors.white70),
                            textDirection: TextDirection.rtl,
                          ),
                          Divider(
                            height: 20,
                            indent: 35,
                            endIndent: 35,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          Text(
                            "${Data.weekDays[homeLogic.nowGregorianDate.weekday]['en']}, ${Data.months[homeLogic.nowGregorianDate.month]['gregorian']['en']} ${homeLogic.nowGregorianDate.day}/${homeLogic.nowGregorianDate.month}/${homeLogic.nowGregorianDate.year}",
                            style: homeLogic.textTheme.body1,
                            textAlign: TextAlign.center,
                          ),
                          Flexible(
                            child: Container(),
                            flex: 1,
                          ),
                          Text(
                            "شهر ${Data.months[homeLogic.nowGregorianDate.month]['gregorian']['ar']}",
                            style: homeLogic.textTheme.body1,
                            textAlign: TextAlign.center,
                          ),
                          Flexible(
                            child: Container(),
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 6,
                ),
                Center(
                  child: SelectConvert(
                    convertDate: dateConverterLogic.hijriToGregorian,
                    isGregorianToHijri: false,
                    text: 'اتحويل من هجري إلى ميلادي',
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Center(
                  child: SelectConvert(
                    isGregorianToHijri: true,
                    convertDate: dateConverterLogic.gregorianToHijri,
                    text: 'اتحويل من ميلادى إلى هجري',
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
