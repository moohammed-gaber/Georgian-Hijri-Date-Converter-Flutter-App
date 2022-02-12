import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date/logic/date_converter.dart';
import 'package:flutter_date/logic/home.dart';
import 'package:flutter_date/features/date/presentation/pages/home.dart';
import 'package:flutter_date/screens/date_converter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'util/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Screen screen;
    return MultiProvider(
        providers: [
          Provider(
            create: (_) => screen,
          ),
          Provider(
            create: (ctx) => HomeLogic(),
          ),
          ChangeNotifierProvider(
            create: (_) => DateConverterLogic(),
          )
        ],
        child: MaterialApp(
          initialRoute: Home.route,
          routes: {
            Home.route: (_) => Home(),
            DateConverter.route: (_) => DateConverter()
          },
          builder: (BuildContext context, Widget child) {
            return new Directionality(
                textDirection: TextDirection.rtl,
                child: new Builder(
                  builder: (BuildContext context) {
                    screen = Screen(MediaQuery.of(context).size,
                        MediaQuery.textScaleFactorOf(context));
                    print(screen.textScale);

                    HomeLogic homeLogic = Provider.of(context);
                    homeLogic.themeData = Theme.of(context);
                    homeLogic.textTheme = homeLogic.themeData.textTheme;

                    return child;
                  },
                ));
          },
          theme: ThemeData(
              colorScheme: ColorScheme.light(),
              primaryColorBrightness: Brightness.dark,
              fontFamily: GoogleFonts.cairo().fontFamily,
              textTheme: TextTheme(
                  headline3: TextStyle(color: Colors.white),
                  bodyText1: TextStyle(fontSize: 18, color: Colors.white),
                  bodyText2: TextStyle(fontSize: 30, color: Colors.white))),
          debugShowCheckedModeBanner: false,
        ));
  }
}
