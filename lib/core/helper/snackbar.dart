import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ShowSnackBar {
  static void showSuccessSnackBar(BuildContext ctx, String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: ctx.textTheme.bodyText1?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

  static void showErrorSnackBar(BuildContext ctx, String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: ctx.textTheme.bodyText1?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }
}
