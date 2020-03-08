import 'package:flutter/material.dart';

class Test {
  String name = 'mohamed';
}

class ExtendedTest extends Test {
  ExtendedTest() {
    print(name);
  }
}
