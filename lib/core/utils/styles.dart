import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_manager_app/core/utils/app_colors.dart';

class Styles {
  static TextStyle fontSizeMedium12 = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 12),
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontSizeBold30 = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 30),
    fontWeight: FontWeight.bold,
    color: AppColors.kLoginHeadlineColor,
  );
  static TextStyle fontSizeBold16 = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.bold,
  );
  static TextStyle fontSizeBold20 = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.bold,
  );
}

double getResponsiveFontSize({required double fontSize}) {
  double scaleFactor = getScaleFactor();
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor() {
  var dispatcher = PlatformDispatcher.instance;
  var physicalWidth = dispatcher.views.first.physicalSize.width;
  var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  double width = physicalWidth / devicePixelRatio;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
