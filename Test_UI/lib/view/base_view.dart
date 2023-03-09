import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  BaseViewState createState() => BaseViewState();
}

class BaseViewState<T extends BaseView> extends State<T> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    createViewModel();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => onBuildCompleted());
  }

  void createViewModel() {
    // Override for create ViewModel each View
  }

  /// Register notify when viewModel other call notifyListener()
  void onBuildCompleted() {
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

}
