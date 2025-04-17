import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSpacingStyles {
  static EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
  );
}
