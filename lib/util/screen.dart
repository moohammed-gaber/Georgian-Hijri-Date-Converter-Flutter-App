import 'package:flutter/material.dart';

class Screen {
  final Size screenSize;
  double textScale;
  Screen(this.screenSize, this.textScale);
  get height => screenSize.height;
  get width => screenSize.width;
  get aspectRatio => screenSize.aspectRatio;
}
