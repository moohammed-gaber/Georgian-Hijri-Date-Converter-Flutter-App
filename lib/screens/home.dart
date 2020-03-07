import 'package:flutter/material.dart';
import 'package:flutter_date/logic/date_converter.dart';
import 'package:flutter_date/models/date_converter_model_args.dart';
import 'package:flutter_date/screens/date_converter.dart';
import 'package:flutter_date/util/data.dart';
import 'package:flutter_date/util/screen.dart';
import 'package:hijri/umm_alqura_calendar.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';

class Home extends StatefulWidget {
  static const route = '/';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ThemeData themeData;
  TextTheme textTheme;
  var offWhite = Color(0xffE2D5E5);
  var white = Colors.white;
  var orange = Color(0xffEBB944);
  DateTime nowGregorianDate;
  Jalali jalali;
  ummAlquraCalendar ummAlquraDate;
  Screen screen;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screen = Screen(MediaQuery.of(context).size);
    themeData = Theme.of(context);
    textTheme = themeData.textTheme;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nowGregorianDate = DateTime.now();
    ummAlquraDate = ummAlquraCalendar.now();
    jalali = Jalali.now();
  }

  @override
  Widget build(BuildContext context) {
    var _check_date = new ummAlquraCalendar();
    DateConverterLogic dateConverterLogic =
        Provider.of<DateConverterLogic>(context);

    _check_date.hYear = 1439;
    _check_date.hMonth = 11;
    _check_date.hDay = 30;
    print(_check_date.isValid()); // false -> This month is only 29 days
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
                                Data.months[ummAlquraDate.hMonth]['ummAlqura'],
                                style: textTheme.body2,
                              ),
                              Text(
                                Data.weekDays[nowGregorianDate.weekday]['ar'],
                                style: textTheme.body2.copyWith(color: orange),
                              ),
                            ],
                          ),
                          Text(
                              '${ummAlquraDate.hYear} / ${ummAlquraDate.hMonth} / ${ummAlquraDate.hDay}',
                              style: textTheme.display2),
                          Text(
                            '${jalali.day} ${Data.months[jalali.month]['jalali']} ${jalali.year} ',
                            style:
                                textTheme.body1.copyWith(color: Colors.white70),
                            textDirection: TextDirection.rtl,
                          ),
                          Divider(
                            height: 20,
                            indent: 35,
                            endIndent: 35,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          Text(
                            "${Data.weekDays[nowGregorianDate.weekday]['en']}, ${Data.months[nowGregorianDate.month]['gregorian']['en']} ${nowGregorianDate.day}/${nowGregorianDate.month}/${nowGregorianDate.year}",
                            style: textTheme.body1,
                            textAlign: TextAlign.center,
                          ),
                          Flexible(
                            child: Container(),
                            flex: 1,
                          ),
                          Text(
                            "شهر ${Data.months[nowGregorianDate.month]['gregorian']['ar']}",
                            style: textTheme.body1,
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
                    child: _convertingButton('التحويل من هجري الي ميلادي',
                        isGregorianToHijri: false,
                        manyOperation: dateConverterLogic.dayValidatorHijri)),
                Spacer(
                  flex: 1,
                ),
                Center(
                    child: _convertingButton('التحويل من ميلادى الي هجري',
                        isGregorianToHijri: true,
                        manyOperation:
                            dateConverterLogic.dayValidatorGregorian)),
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

  Widget _convertingButton(String text,
      {bool isGregorianToHijri, ManyOperation manyOperation}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(DateConverter.route,
            arguments: DateConverterModelArgs(manyOperation));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xff171344),
        ),
        width: screen.width / 1.3,
        height: screen.height / 10,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
