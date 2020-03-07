import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hijri/umm_alqura_calendar.dart';

typedef String ManyOperation(String text); //function signature
typedef void ConvertDate(BuildContext context);

class DateConverterLogic with ChangeNotifier {
  String message = '';
  var dayTextFieldController = TextEditingController();
  var monthTextFieldController = TextEditingController();
  var yearTextFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ummAlquraCalendar result;

  String dayValidatorGregorian(String text) {
    var intDay = int.tryParse(text);
    var intYear = int.tryParse(yearTextFieldController.text);
    var intMonth = int.tryParse(monthTextFieldController.text);
    if (intMonth < 12) {
      if (intDay > 31 || intDay == null) {
        message = 'عدد ايام الشهر لا تتجاوز 31 يوم';

        return '';
      }
      if (intMonth == 2) {
        if (intMonth > 29) {
          message = 'شهر فبراير عدد ايامه لا يتجاوز الـ 29 يوم';

          return '';
        } else {
          if (intYear != null) {
            if (intYear % 4 == 0 && intDay != 29 ||
                intYear % 4 != 0 && intDay != 28) {
              message =
                  'سنه 2000 شهر فبراير بها عدد ايامه لا يتجاوز الـ 28 يوم';

              return '';
            }
          }
        }
      }
      if (intMonth != null) {
        if (intMonth == 4 ||
            intMonth == 6 ||
            intMonth == 9 ||
            intMonth == 11 && intDay > 30) {
          message = 'شهر مارس عدد ايامه لا يتجاوز الـ 30 يوم';

          return '';
        } else {
          if (intDay > 31 && intMonth != 2) {
            message = 'شهر مارس عدد ايامه لا يتجاوز الـ 30 يوم';

            return '';
          }
        }
      }
    }
  }

  String monthValidator(String text) {
    var intMonth = int.tryParse(text);
    if (intMonth == null) {
      return '';
    }
    if (intMonth > 12) {
      message = 'عدد شهور السنه لا يتجاوز 12 شهر';
      return '';
    }
  }

  String yearValidator(String text) {
    var intYear = int.tryParse(text);

    if (intYear == null) {
      return '';
    }

    if (intYear < 1938) {
      message = 'يمكن التحويل من سنه 1937 ميلادى الى ما فوق الى 16 سنه 2077';
      return '';
    }
  }

  String dayValidatorHijri(
    String text,
  ) {}
  String dayValidator(String text, ManyOperation oper) {
    return oper(text);
  }

  void convertToGregorian(BuildContext context) {
    FocusScope.of(context).unfocus();
    bool validation = formKey.currentState.validate();
    result = null;
    if (validation) {
      this.result = (ummAlquraCalendar.fromDate(new DateTime(
          int.parse(yearTextFieldController.text),
          int.parse(monthTextFieldController.text),
          int.parse(dayTextFieldController.text))));
      notifyListeners();
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ));
    }
  }

  void convertToHijri(BuildContext context) {
    FocusScope.of(context).unfocus();
    bool validation = formKey.currentState.validate();
    result = null;
    if (validation) {
      this.result = (ummAlquraCalendar().hijriToGregorian(
          int.parse(yearTextFieldController.text),
          int.parse(monthTextFieldController.text),
          int.parse(dayTextFieldController.text)));
      notifyListeners();
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ));
    }
  }

  void convertDate(BuildContext context, ConvertDate convertDate) {
    convertDate(context);
  }

  void clearForm() {
    dayTextFieldController.clear();

    monthTextFieldController.clear();
    yearTextFieldController.clear();
  }

  Future<bool> onWillPop() async {
    clearForm();
    return true;
  }
}
