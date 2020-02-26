import 'package:flutter/material.dart';
import 'package:flutter_date/hijry_to_mieladey.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("التاريخ الهجري والميلادي"),centerTitle: true,),
      // backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                color: Colors.blueGrey,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "شهر جمادي الاخرة",
                          style: TextStyle(color: Colors.white70, fontSize: 22),
                        ),
                        Text(
                          "الاثنين",
                          style: TextStyle(color: Colors.yellow, fontSize: 26),
                        ),
                      ],
                    ),
                    Text("30/6/1441",style: TextStyle(color: Colors.white, fontSize: 26),),
                    Text("  الحوت 1398 ه ش 5",style: TextStyle(color: Colors.white70, fontSize: 20),),
                    Divider(height: 5,
                      color: Colors.black,),
                    Text("monday,february 24/2/2020",style: TextStyle(color: Colors.white, fontSize: 24),textAlign: TextAlign.center,),
                    Text("شهر فبراير - شباط",style: TextStyle(color: Colors.white, fontSize: 26),textAlign: TextAlign.center,),


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,right: 10,left: 10,bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(

                      child: Text("التحويل من هجري الي ميلادي"),
                      onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HigryToMiladey()),
                      );}),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                    child: Text("التحويل من ميلادي الي هجري"),
                    onPressed: (){}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


