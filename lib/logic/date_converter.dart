import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date/logic/home.dart';
import 'package:flutter_date/util/data.dart';
import 'package:hijri/umm_alqura_calendar.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

typedef String DayValidator(
    String text, BuildContext context); //function signature
typedef void ConvertType(BuildContext context);
typedef String YearValidator(String text, BuildContext context);

class DateConverterLogic with ChangeNotifier {
  var dayTextFieldController = TextEditingController();
  var monthTextFieldController = TextEditingController();
  var yearTextFieldController = TextEditingController();
  ConvertType convertType;
  YearValidator yearValidator;
  DayValidator dayValidator;
  final formKey = GlobalKey<FormState>();
  dynamic result;
  bool isKeyBoardVisible = false;
  final GlobalKey<FormState> yearValidation = GlobalKey();
  final GlobalKey<FormState> dayValidation = GlobalKey();

  KeyboardVisibilityNotification keyboardVisibilityNotification =
      KeyboardVisibilityNotification();

  DateConverterLogic() {
    keyboardVisibilityNotification.addNewListener(
        onHide: () {},
        onChange: (visible) {
          this.isKeyBoardVisible = visible;
          notifyListeners();
        },
        onShow: () {
          print('!!');
        });
  }

  void gregorianToHijri(BuildContext context) {
    convertType = convertToHijri;
    yearValidator = yearValidatorToHijri;
    dayValidator = dayValidatorToHijri;
  }

  void hijriToGregorian(BuildContext context) {
    convertType = convertToGregorian;
    yearValidator = yearValidatorToGregorian;
    dayValidator = dayValidatorToGregorian;
  }

  String myDayValidator(
      String text, BuildContext context, DayValidator dayValidator) {}
  String dayValidatorToHijri(String text, BuildContext context) {
    var intDay = int.tryParse(text);
    var intYear = int.tryParse(yearTextFieldController.text);
    var intMonth = int.tryParse(monthTextFieldController.text);
    if (intDay > 31) {
      showError(context, 'عدد ايام الشهر لا تتجاوز 31 يوم');

      return '';
    }
    if (intMonth != null) {
      if ((intMonth == 4 || intMonth == 6 || intMonth == 9 || intMonth == 11) &&
          intDay > 30) {
        showError(context,
            ' شهر ${Data.months[intMonth]['gregorian']['ar']} عدد ايامه لا يتجاوز الـ 30 يوم');

        return '';
      }
    }
    if (intMonth == 2) {
      print('!!!');
      if (intDay > 29) {
        showError(context, 'شهر فبراير عدد ايامه لا يتجاوز الـ 29 يوم');

        return '';
      } else {
        if (intYear != null) {
          if (intYear % 4 != 0 && intDay > 28) {
            showError(context,
                'سنه $intYear شهر فبراير بها عدد ايامه لا يتجاوز الـ 28 يوم');

            return '';
          }
        }
      }
    }
  }

  String dayValidatorToGregorian(String text, BuildContext context) {
    var intDay = int.tryParse(text);
    var intYear = int.tryParse(yearTextFieldController.text);
    var intMonth = int.tryParse(monthTextFieldController.text);
    if (intDay > 31) {
      showError(context, 'عدد ايام الشهر لا تتجاوز 31 يوم');

      return '';
    }

    if (monthValidator(monthTextFieldController.text, context) != null &&
        yearValidator(yearTextFieldController.text, context) != null) {
      var _check_date = new ummAlquraCalendar();
      _check_date.hYear = intYear;
      _check_date.hMonth = intMonth;
      _check_date.hDay = intDay;
      if (!_check_date.isValid()) {
        showError(context, 'الشهر $intMonth لا يوجد به اليوم $intDay');
        return '';
      }
    }

/*
      var lengthOfMonth = ummAlquraCalendar
          .fromDate(DateTime(intYear, intMonth, intDay))
          .lengthOfMonth;
      if (lengthOfMonth < intDay) {
        showError(context,
            ' شهر ${Data.months[intMonth]['ummAlqura']} عدد ايامه لا يتجاوز الـ $lengthOfMonth يوم');
        return '';
      }
    }*/
  }

  String monthValidator(String text, BuildContext context) {
    var intMonth = int.tryParse(text);
    if (intMonth > 12) {
      showError(context, 'عدد شهور السنه لا يتجاوز 12 شهر');
      return '';
    }
  }

  String yearValidatorToHijri(String text, BuildContext context) {
    var intYear = int.tryParse(text);
    if (intYear > 2076 || intYear < 1936) {
      showError(context, ' يمكن التحويل من سنه 1936 الى 2076');
      return '';
    }
  }

  String yearValidatorToGregorian(String text, BuildContext context) {
    var intYear = int.tryParse(text);
    if (intYear > 1499 || intYear < 1357) {
      showError(context, 'يمكن التحويل من سنه 1357  الى 1499');
      return '';
    }
  }

  void convertDate(BuildContext context, ConvertType convertType) {
    convertType(context);
  }

  void convertToGregorian(BuildContext context) {
    FocusScope.of(context).unfocus();
    bool validation = formKey.currentState.validate();
    result = null;
    if (validation) {
      result = (ummAlquraCalendar().hijriToGregorian(
          int.parse(yearTextFieldController.text),
          int.parse(monthTextFieldController.text),
          int.parse(dayTextFieldController.text)));
      notifyListeners();
    }
  }

  void convertToHijri(BuildContext context) {
    FocusScope.of(context).unfocus();
    bool validation = formKey.currentState.validate();
    result = null;
    if (validation) {
      this.result = (ummAlquraCalendar.fromDate(DateTime(
          int.parse(yearTextFieldController.text),
          int.parse(monthTextFieldController.text),
          int.parse(dayTextFieldController.text))));
      notifyListeners();
    }
  }

  void clear() {
    result = null;

    dayTextFieldController.clear();
    monthTextFieldController.clear();
    yearTextFieldController.clear();
  }

  void showError(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  Future<bool> onWillPop() async {
    clear();
    return true;
  }
}
