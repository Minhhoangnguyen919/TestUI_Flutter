import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  static final List<ChangeNotifier> _notifierList = [];

  List<ChangeNotifier> get notifierList =>
      _notifierList;

  bool _isEmptyListeners = false;

  late BuildContext context;

  void onInitViewModel(BuildContext context) {
    this.context = context;
  }

  // Function will check size device change
  bool checkReCalculatorSize({required bool allowReCalculatorSize}) {
    return allowReCalculatorSize;
  }

  // When View build success, allow call setState().
  // When need update UI by other viewModels set isNeedReBuildByOtherViewModel is true
  void onBuildComplete({bool isNeedReBuildByOtherViewModel = true}) {
    if (isNeedReBuildByOtherViewModel && !_notifierList.contains(this)) {
      _notifierList.add(this);
    }
  }

  void updateCurrentUI() {
    notifyListeners();
  }

  void updateUI() {
    if (!_isEmptyListeners) {
      notifyListeners();
    }
    if (_notifierList.isEmpty) return;
    for (ChangeNotifier notifier in _notifierList) {
      if (notifier != this) {
        notifier.notifyListeners();
      }
    }
  }


  // Call when: dispose or change screen
  void clearNotifier() {
    _notifierList.clear();
  }

  @override
  void dispose() {
    _isEmptyListeners = true;
    removeNotifier();
    super.dispose();
  }

  void removeNotifier() {
    if (_notifierList.contains(this)) {
      _notifierList.remove(this);
    }
  }
}
