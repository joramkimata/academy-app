import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';

Container circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(
      top: 10.0,
    ),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        AppColors.bgColor,
      ),
    ),
  );
}

Container linearProgress() {
  return Container(
    padding: EdgeInsets.only(
      bottom: 10.0,
    ),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        AppColors.bgColor,
      ),
    ),
  );
}
