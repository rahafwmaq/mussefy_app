import 'package:flutter/material.dart';
import 'package:mussefy_app/view_layout/color.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
            child: LinearProgressIndicator(
          backgroundColor: blue,
          color: red,
        ));
      });
}
