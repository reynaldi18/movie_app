import 'package:flutter/material.dart';

import 'colors.dart';

class ThemeConfig {
  SliderThemeData sliderTheme = SliderThemeData(
    thumbColor: BaseColors.primary,
    inactiveTickMarkColor: Colors.transparent,
    activeTickMarkColor: BaseColors.primary,
    inactiveTrackColor: BaseColors.background,
    trackHeight: 5.0,
    overlayColor: BaseColors.primary.withOpacity(0.5),
    overlappingShapeStrokeColor: Colors.amber,
    valueIndicatorColor: BaseColors.primary,
    activeTrackColor: BaseColors.primary,
    trackShape: CustomTrackShape(),
  );

  CheckboxThemeData checkboxTheme = CheckboxThemeData(
    fillColor: MaterialStateProperty.all(BaseColors.primary),
  );

  ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(BaseColors.primary),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
  );

  TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(BaseColors.primary),
      overlayColor: MaterialStateProperty.all(BaseColors.primaryAccent),
    ),
  );

  ThemeData get defaultConfig => ThemeData(
        primaryColor: BaseColors.primary,
        focusColor: BaseColors.primary,
        splashColor: BaseColors.primaryAccent,
        dividerColor: Colors.transparent,
        checkboxTheme: checkboxTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        textButtonTheme: textButtonTheme,
        sliderTheme: sliderTheme,
        fontFamily: 'SpaceGrotesk', colorScheme: ColorScheme.fromSwatch(
          primarySwatch: BaseColors.materialPrimary,
        ).copyWith(secondary: BaseColors.primaryAccent),
      );
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox? parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData? sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme?.trackHeight ?? 0.0;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox?.size.height ?? 0.0 - trackHeight) / 2;
    final double trackWidth = parentBox?.size.width ?? 0.0;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
