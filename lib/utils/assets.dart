import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/app_colors.dart';
import 'color_utils.dart';

///This file is automatically generated.
/// DO NOT EDIT, all your changes would be lost.
class Assets {
  Assets._();
}

extension AssetsHelper on String {
  SvgPicture svg({
    Color? color,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      this,
      color: color,
      height: height,
      width: width,
      fit: fit,
    );
  }

  Image get png => Image.asset(this);

  SvgPicture dynamicColoredSvg({
    Color lightColor = AppColors.white,
    Color darkColor = AppColors.darkGray,
    bool invertColor = false,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      this,
      color: brightnessColor(
        lightColor: lightColor,
        darkColor: darkColor,
        invert: invertColor,
      ),
      height: height,
      width: width,
      fit: fit,
    );
  }
}