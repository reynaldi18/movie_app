import 'package:flutter/material.dart';

// Horizontal Spacing
Widget horizontalSpace(double size) => SizedBox(width: size);

// Vertical Spacing
Widget verticalSpace(double size) => SizedBox(height: size);

// Screen Size helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
