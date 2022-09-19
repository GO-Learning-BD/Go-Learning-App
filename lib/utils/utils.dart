import "dart:developer" as devtools show log;

import "package:app/app_config/resources.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart"
    show
        FloatingLabelBehavior,
        InputBorder,
        InputDecoration,
        OutlineInputBorder;
import "package:flutter/widgets.dart";

class Utils {
  static void log(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Object? extra,
  }) {
    if (kDebugMode) {
      devtools.log(
        message,
        time: DateTime.now(),
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  static String _twoDigits(int n) => n.toString().padLeft(2, "0");

  static String getMmSsFormat(Duration duration) {
    String twoDigitMinutes = _twoDigits(duration.inMinutes);
    String twoDigitSeconds = _twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  static String getHhMmSsFormat(Duration duration) {
    String twoDigitHours = _twoDigits(duration.inHours);
    String twoDigitMinutes = _twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = _twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  static InputDecoration getAppInputDecoration({
    String? hint,
    String? label,
    double? borderRadius,
    Widget? prefix,
    String? prefixText,
    Widget? prefixIcon,
    BoxConstraints? prefixIconConstraints,
    Widget? suffix,
    String? suffixText,
    Widget? suffixIcon,
    BoxConstraints? suffixIconConstraints,
    bool showCounterText = true,
    TextStyle? counterTextStyle,
    Color? hintOrLabelColor,
    Color? errorColor,
    Color? errorOutlineColor,
    Color? enabledBorderColor,
    Color? focusedBorderColor,
    Color? backgroundColor,
    double? borderThickness,
    double? focusedBorderThickness,
    double? errorBorderThickness,
    double? focusedErrorBorderThickness,
    EdgeInsets? contentPadding,
    bool? isCollapsed,
    bool? isDense,
  }) {
    borderRadius ??= Res.dimen.defaultBorderRadiusValue;
    hintOrLabelColor ??= Res.color.textSecondary;
    errorColor ??= Res.color.textError;
    errorOutlineColor ??= Res.color.outlineError;
    enabledBorderColor ??= Res.color.outline;
    focusedBorderColor ??= Res.color.outlineFocused;
    backgroundColor ??= Res.color.inputFieldBg;

    borderThickness ??= Res.dimen.defaultBorderThickness;
    focusedBorderThickness ??= Res.dimen.defaultBorderThickness;
    errorBorderThickness ??= borderThickness;
    focusedErrorBorderThickness ??= focusedBorderThickness;

    return InputDecoration(
      hintText: hint,
      hintStyle: Res.textStyles.secondary.copyWith(
        color: hintOrLabelColor,
      ),
      helperStyle: Res.textStyles.ternary.copyWith(
        fontSize: Res.dimen.fontSizeSmall,
      ),
      labelText: label,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelStyle: Res.textStyles.secondary.copyWith(
        color: hintOrLabelColor,
      ),
      border: borderThickness == 0
          ? InputBorder.none
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: enabledBorderColor,
                width: borderThickness,
              ),
            ),
      focusedBorder: focusedBorderThickness == 0
          ? InputBorder.none
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: focusedBorderColor,
                width: focusedBorderThickness,
              ),
            ),
      errorStyle: Res.textStyles.error.copyWith(
        color: errorColor,
        fontSize: Res.dimen.fontSizeSmall,
      ),
      errorBorder: errorBorderThickness == 0
          ? InputBorder.none
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: errorOutlineColor,
                width: errorBorderThickness,
              ),
            ),
      focusedErrorBorder: focusedErrorBorderThickness == 0
          ? InputBorder.none
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: errorOutlineColor,
                width: focusedErrorBorderThickness,
              ),
            ),
      enabledBorder: borderThickness == 0
          ? InputBorder.none
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: enabledBorderColor,
                width: borderThickness,
              ),
            ),
      fillColor: backgroundColor,
      filled: true,
      contentPadding: contentPadding,
      isCollapsed: isCollapsed ?? false,
      isDense: isDense,
      prefix: prefix,
      prefixText: prefixText,
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIconConstraints,
      suffix: suffix,
      suffixText: suffixText,
      suffixIcon: suffixIcon,
      suffixIconConstraints: suffixIconConstraints,
      counterText: showCounterText ? null : "",
      counterStyle: counterTextStyle,
    );
  }
}
