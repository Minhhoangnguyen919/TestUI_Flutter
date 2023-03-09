import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ui/constans/image/image_constans.dart';
import 'package:test_ui/dimens/dimens_main_view.dart';
import 'package:test_ui/dimens/dimens_manager.dart';

import 'base_view.dart';

class MyHomeView extends BaseView {
  const MyHomeView({super.key});

  @override
  BaseViewState<MyHomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseViewState<MyHomeView> {

  late DimensMainView viewSize;

  @override
  void createViewModel() {
    DimensManager();
    viewSize = DimensManager.mainDimension;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        DimensManager.mainDimension.allowCalculatorSize(
            context: context,
            calculatorSizeFunc: () {
              DimensManager.instance.calculatorRatio<MyHomeView>(context);
            });
        return Stack(
          children: [
            buildPositioned(
              context: context,
              top: viewSize.topBlue,
              left: viewSize.leftBlue,
              listColor: [
                Colors.blue.shade200,
                Colors.blue.shade100,
                Colors.blue.shade50,
              ],
            ),
            buildPositioned(
              context: context,
              top: viewSize.top,
              left: viewSize.left,
              listColor: [
                Colors.redAccent.shade400,
                Colors.redAccent.shade200,
                Colors.redAccent.shade100,
              ],
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 50,
                  sigmaY: 30,
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: viewSize.positionTop,
                    left: viewSize.positionLeft,
                  ),
                  child: SvgPicture.asset(
                    Images.logo,
                    // color: Colors.black,
                    height: viewSize.heightImage,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Positioned buildPositioned({
    required BuildContext context,
    required double top,
    required double left,
    required List<Color> listColor,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Row(
        children: [
          Container(
            width: viewSize.size,
            height: viewSize.size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: listColor),
              borderRadius: BorderRadius.circular(360),
            ),
          ),
        ],
      ),
    );
  }
}