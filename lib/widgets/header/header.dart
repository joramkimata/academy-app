import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';
import 'package:izwebacademy_app/support/routes/routes.dart';

AppBar header(context) {
  return AppBar(
    title: Text(
      "Izweb Academy",
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
    ),
    backgroundColor: AppColors.bgColor,
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.search,
        ),
        onPressed: () {
          Navigator.popAndPushNamed(context, Routes.loginUrl);
        },
        color: Colors.white,
      )
    ],
  );
}
