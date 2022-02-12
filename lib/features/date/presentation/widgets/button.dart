import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_date/logic/date_converter.dart';
import 'package:flutter_date/logic/home.dart';
import 'package:flutter_date/models/date_converter_model_args.dart';
import 'package:flutter_date/screens/date_converter.dart';
import 'package:flutter_date/util/screen.dart';
import 'package:provider/provider.dart';

class SelectConvert extends StatelessWidget {
  String text;
  ConvertType convertType;
  SelectConvert({
    @required this.text,
    @required this.convertType,
  });

  @override
  Widget build(BuildContext context) {
    Screen screen = Provider.of<Screen>(context);
    DateConverterLogic dateConverterLogic =
        Provider.of<DateConverterLogic>(context);
    return SizedBox(
      height: screen.height / 10,
      width: screen.width / 1.2,
      child: FlatButton(
        color: Colors.purple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          dateConverterLogic.clear();
          dateConverterLogic.convertDate(context, this.convertType);
          await Navigator.of(context).pushNamed(
            DateConverter.route,
          );
        },
      ),
    );
  }
}
