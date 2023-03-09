import 'package:flutter/cupertino.dart';
import 'package:test_ui/dimens/dimens_main_view.dart';
import 'package:test_ui/view/my_home_view.dart';

class DimensManager {
  static late DimensManager _instance;

  static DimensManager get instance => _instance;

  late DimensMainView _mainDimension;

  static DimensMainView get mainDimension => _instance._mainDimension;

  void _initDimens() {
    _mainDimension = DimensMainView();
  }

  factory DimensManager() {
    return _instance = DimensManager._();
  }

  DimensManager._() {
    _initDimens();
  }

  void calculatorRatio<T>(BuildContext context) {
    switch (T) {
      // TODO add dimens many view
      case MyHomeView:
        _mainDimension.calculatorRatio<T>(context);
        break;
    }
  }
}
