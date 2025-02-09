import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../res/styles/colors.dart';
import '../res/styles/text.dart';

class CoreUtils{
  static Color adaptiveColour(
      BuildContext context, {
        required Color lightModeColour,
        required Color darkModeColour,
      }) {
    return context.isDarkMode ? darkModeColour : lightModeColour;
  }

  static void postFrameCall(VoidCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static void showSnackBar(BuildContext context, {required String message, Color? backgroundColour,}) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        backgroundColor: backgroundColour ?? Colours.lightThemePrimaryColour,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: TextStyles.paragraphSubTextRegular1.white,
        ),
        duration: _calculateDuration(message),
      );

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    });
  }

  static Duration _calculateDuration(String message) {
    // Average reading speed in words per minute
    const int averageWPM = 200;

    // Average word length in characters
    const int averageWordLength = 5;

    // Calculate milliseconds per character based on average reading speed
    const int millisecondsPerWord = (60 * 1000) ~/ averageWPM;
    const int millisecondsPerCharacter =
        millisecondsPerWord ~/ averageWordLength;

    // Calculate the duration based on the length of the message
    final int durationInMilliseconds =
        message.length * millisecondsPerCharacter;

    // Limit the duration to a reasonable maximum
    const int maxDurationMilliseconds = 5000; // 5 seconds
    final int finalDuration =
    durationInMilliseconds.clamp(1000, maxDurationMilliseconds);

    return Duration(milliseconds: finalDuration);
  }
}