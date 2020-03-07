import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date/logic/home.dart';
import 'package:flutter_date/util/data.dart';
import 'package:hijri/umm_alqura_calendar.dart';

typedef String DayValidator(
    String text, BuildContext context); //function signature
typedef void ConvertDate(BuildContext context);
typedef String YearValidator(String text, BuildContext context);

class DateConverterLogic with ChangeNotifier {
  String message = '';
  var dayTextFieldController = TextEditingController();
  var monthTextFieldController = TextEditingController();
  var yearTextFieldController = TextEditingController();
  ConvertDate converterDate;
  YearValidator yearValidator;
  DayValidator dayValidator;

  void convertType(BuildContext context, ConvertDate convertDate) {
    convertDate(context);
  }

  void gregorianToHijri(BuildContext context) {
    converterDate = convertToHijri;
    yearValidator = yearValidatorToHijri;
    dayValidator = dayValidatorToHijri;
  }

  void hijriToGregorian(BuildContext context) {
    converterDate = convertToGregorian;
    yearValidator = yearValidatorToGregorian;
    dayValidator = dayValidatorToGregorian;
  }

  final formKey = GlobalKey<FormState>();
  ummAlquraCalendar result;
//  String dayValidator(String text, DayValidator oper, BuildContext context) {
//    return oper(text, context);
//  }

  String dayValidatorToHijri(String text, BuildContext context) {
    var intDay = int.tryParse(text);
    var intYear = int.tryParse(yearTextFieldController.text);
    var intMonth = int.tryParse(monthTextFieldController.text);
    if (intDay == null) {
      return '';
    }
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

  String dayValidatorToGregorian(String text, BuildContext context) {}

  String monthValidator(String text, BuildContext context) {
    var intMonth = int.tryParse(text);
    if (intMonth == null) {
      return '';
    }
    if (intMonth > 12) {
      showError(context, 'عدد شهور السنه لا يتجاوز 12 شهر');
      return '';
    }
  }

//  String yearValidator(String text, YearValidator oper, BuildContext context) {
//    oper(text, context);
//  }

  String yearValidatorToHijri(String text, BuildContext context) {
    var intYear = int.tryParse(text);

    if (intYear == null) {
      return '';
    }

    if (intYear < 1938) {
      showError(context, 'يمكن التحويل من سنه 1937 ميلادى الى 2077');
      return '';
    }
  }

  String yearValidatorToGregorian(String text, BuildContext context) {
    var intYear = int.tryParse(text);
    if (intYear == null) {
      return '';
    }

    if (intYear < 1357) {
      showError(context, 'يمكن التحويل من سنه 1357 هجري الى 1500');
      return '';
    }
  }

  void convertDate(BuildContext context, ConvertDate convertDate) {
    convertDate(context);
    notifyListeners();
  }

  void convertToGregorian(BuildContext context) {
    FocusScope.of(context).unfocus();
    bool validation = formKey.currentState.validate();
    result = null;
    if (validation) {
      this.result = (ummAlquraCalendar().hijriToGregorian(
          int.parse(yearTextFieldController.text),
          int.parse(monthTextFieldController.text),
          int.parse(dayTextFieldController.text)));
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

  void clearForm() {
    dayTextFieldController.clear();

    monthTextFieldController.clear();
    yearTextFieldController.clear();
  }

  void showError(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }

  Future<bool> onWillPop() async {
//    clearForm();
    return true;
  }
}
