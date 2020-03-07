import 'package:flutter/material.dart';

class Screen {
  final Size screenSize;
  Screen(this.screenSize);
  get height => screenSize.height;
  get width => screenSize.width;
  get aspectRatio => screenSize.aspectRatio;
}
