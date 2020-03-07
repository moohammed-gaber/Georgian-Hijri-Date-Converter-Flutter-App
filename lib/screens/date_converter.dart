import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_date/logic/date_converter.dart';
import 'package:flutter_date/models/date_converter_model_args.dart';
import 'package:flutter_date/util/screen.dart';
import 'package:flutter_date/widgets/text_field.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:hijri/umm_alqura_calendar.dart';
import 'package:provider/provider.dart';

class DateConverter extends StatefulWidget {
  static const route = '/dateConverter';

  @override
  _DateConverterState createState() => _DateConverterState();
}

class _DateConverterState extends State<DateConverter> {
  DateConverterModelArgs args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context).settings.arguments;
  }

  bool isKeyBoardVisible = false;
  @override
  Widget build(BuildContext context) {
    DateConverterLogic dateConverterLogic =
        Provider.of<DateConverterLogic>(context);
    Screen screen = Provider.of<Screen>(context);
//todo put this in initState
    KeyboardVisibilityNotification().addNewListener(
        onHide: () {},
        onChange: (visible) {
          this.isKeyBoardVisible = visible;
          setState(() {});
        },
        onShow: () {
          print('!!');
        });

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {}),
        appBar: isKeyBoardVisible
            ? AppBar(
                backgroundColor: Colors.purple,
                title: Text(
                  args.manyOperation == dateConverterLogic.dayValidatorGregorian
                      ? 'التحويل من الميلادي إلى الهجري'
                      : 'التحويل من الهجري إلى الميلادي',
                  style: TextStyle(fontSize: 15),
                ),
              )
            : PreferredSize(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/background.jpg',
                      fit: BoxFit.cover,
                      width: screen.width,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                image: new NetworkImage(
                                    'https://t4.ftcdn.net/jpg/03/16/63/11/240_F_316631106_ZxfDs61cK2XGToojOnPehKt7vEaAyqbO.jpg'),
                                fit: BoxFit.cover,
                              ),
                              border: new Border.all(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                          args.manyOperation ==
                                  dateConverterLogic.dayValidatorGregorian
                              ? 'التحويل من ميلادي إلى هجري'
                              : 'التحويل من هجري إلى ميلادي',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )),
                        Center(
                            child: Text(
                          'وفق تقويم أم القري',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 12),
                        )),
                      ],
                    )
                  ],
                ),
                preferredSize: Size.fromHeight(200)),
        backgroundColor: Color(0xffF2F2F6),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Form(
              onWillPop: dateConverterLogic.onWillPop,
              key: dateConverterLogic.formKey,
              child: Flexible(
                flex: isKeyBoardVisible ? 14 : 10,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Spacer(
                            flex: 1,
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'التاريخ',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  'الهجري',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'السنة',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                MyTextField(
                                    fieldValidator:
                                        dateConverterLogic.yearValidator,
                                    isYearField: true,
                                    textEditingController: dateConverterLogic
                                        .yearTextFieldController)
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'الشهر',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                MyTextField(
                                    fieldValidator:
                                        dateConverterLogic.monthValidator,
                                    isYearField: false,
                                    textEditingController: dateConverterLogic
                                        .monthTextFieldController)
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'اليوم',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                MyTextField(
                                    fieldValidator: (String text) {
                                      return dateConverterLogic.dayValidator(
                                          text, args.manyOperation);
                                    },
                                    isYearField: false,
                                    textEditingController: dateConverterLogic
                                        .dayTextFieldController)
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Text('نتيجة التحويل',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Spacer(
                  flex: 1,
                ),
                Flexible(
                  flex: 4,
                  child: Text(
                      dateConverterLogic.result == null
                          ? ''
                          : '${dateConverterLogic.result.hDay} / ${dateConverterLogic.result.hMonth} / ${dateConverterLogic.result.hYear}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700)),
                ),
                Spacer(
                  flex: 1,
                )
              ],
            ),
            Spacer(
              flex: 1,
            ),
            ButtonTheme(
              height: 50,
              minWidth: 250,
              child: Center(
                child: Builder(
                  builder: (BuildContext ctx) => FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Colors.purple,
                      onPressed: () {
                        dateConverterLogic.convertDate(
                            ctx,
                            args.manyOperation ==
                                    dateConverterLogic.convertToGregorian
                                ? dateConverterLogic.convertToGregorian
                                : dateConverterLogic.convertToHijri);
                      },
                      child: Text(
                        args.manyOperation ==
                                dateConverterLogic.dayValidatorGregorian
                            ? 'التحويل إلى هجري'
                            : 'التحويل إلى ميلادى',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            ),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
