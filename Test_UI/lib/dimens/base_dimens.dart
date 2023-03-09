import 'package:flutter/material.dart';

class BaseDimens {
  BuildContext? usedContext;

  Orientation _orientation = Orientation.portrait;

  Orientation get orientation => _orientation;

  double fullWidth = 0;

  double fullHeight = 0;

  double textScaleFactor = 0;

  double statusBarHeight = 0;

  double headerBorderHeight = 0;

  double footerTabHeight = 0;

  static double _fullWidthChange = 0.0;

  double get fullWidthChange => _fullWidthChange;

  static double _fullHeightChange = 0.0;

  double get fullHeightChange => _fullHeightChange;

  void calculatorRatio<T>(BuildContext context) {
    _orientation = MediaQuery.of(context).orientation;

    fullWidth = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;
    textScaleFactor = MediaQuery.of(context).textScaleFactor;

    _fullHeightChange = (orientation == Orientation.portrait)
        ? fullHeight
        : fullWidth;

    _fullWidthChange = (orientation == Orientation.portrait)
        ? fullWidth
        : fullHeight;

    initialDimens<T>();
  }

  void initialDimens<T>() {}

  void allowCalculatorSize(
      {required BuildContext context, required Function calculatorSizeFunc}) {
    if (fullWidth == 0 || fullHeight == 0 || usedContext == null) {
      usedContext = context;
      calculatorSizeFunc.call();
    }
    final mediaQueryData = MediaQuery.of(context);
    final newWidth = mediaQueryData.size.width;
    final newHeight = mediaQueryData.size.height;
    final newTextScaleFactor = mediaQueryData.textScaleFactor;
    final newOrientation = mediaQueryData.orientation;
    final result = newWidth != fullWidth ||
        newHeight != fullHeight ||
        newTextScaleFactor != textScaleFactor ||
        newOrientation != _orientation;
    if (result) {
      calculatorSizeFunc.call();
    }
  }

  bool checkAllowCalculatorSize(BuildContext context) {
    if (fullWidth == 0 || fullHeight == 0 || usedContext == null) {
      usedContext = context;
      return true;
    }
    final mediaQueryData = MediaQuery.of(context);
    final newWidth = mediaQueryData.size.width;
    final newHeight = mediaQueryData.size.height;
    final newTextScaleFactor = mediaQueryData.textScaleFactor;
    final newOrientation = mediaQueryData.orientation;
    final result = newWidth != fullWidth ||
        newHeight != fullHeight ||
        newTextScaleFactor != textScaleFactor ||
        newOrientation != _orientation;
    if (result) {
      return true;
    }
    return false;
  }
}
