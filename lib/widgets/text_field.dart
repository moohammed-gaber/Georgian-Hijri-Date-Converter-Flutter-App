import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  bool isYearField;
  TextEditingController textEditingController;
  FormFieldValidator<String> fieldValidator;

  MyTextField(
      {@required this.isYearField,
      @required this.textEditingController,
      @required this.fieldValidator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      controller: textEditingController,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      validator: this.fieldValidator,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      maxLength: isYearField ? 4 : 2,
      decoration: InputDecoration(
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          contentPadding: EdgeInsets.all(10.0),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.1))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.1)))),
    );
  }
}
