import 'package:flutter/material.dart';

import 'base_dimens.dart';

class DimensMainView extends BaseDimens {
  double width = 0.0;
  double heightImage = 0.0;
  double top = 0.0;
  double left = 0.0;
  double topBlue = 0.0;
  double leftBlue = 0.0;
  double positionLeft = 0.0;
  double positionTop = 0.0;
  double positionWidth = 0.0;
  double positionHeight = 0.0;

  double size = 0.0;

  //Size determination for each screen
  @override
  void initialDimens<MainView>() {
    width = (orientation == Orientation.portrait)
        ? fullWidth * 0.3
        : fullHeight * 0.6;
    heightImage = (orientation == Orientation.portrait)
        ? fullHeight * 0.3
        : fullHeight * 0.6;
    top = (orientation == Orientation.portrait)
        ? fullHeight * 0.2
        : fullHeight * 0.2;
    left = (orientation == Orientation.portrait)
        ? fullWidth * 0.2
        : fullWidth * 0.3;
    topBlue = (orientation == Orientation.portrait)
        ? fullHeight * 0.25
        : fullHeight * 0.25;
    leftBlue = (orientation == Orientation.portrait)
        ? fullWidth * 0.5
        : fullWidth * 0.5;
    positionLeft = (orientation == Orientation.portrait)
        ? fullWidth * 0.1
        : fullWidth * 0.1;
    positionTop = (orientation == Orientation.portrait)
        ? fullHeight * 0.05
        : fullHeight * 0.05;
    positionWidth = (orientation == Orientation.portrait)
        ? fullWidth * 0.3
        : fullWidth * 0.3;
    positionHeight = (orientation == Orientation.portrait)
        ? fullWidth * 0.3
        : fullWidth * 0.3;
    size = (orientation == Orientation.portrait)
        ? fullWidth * 0.4
        : fullHeight * 0.4;

  }
}
