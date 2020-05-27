import 'package:flutter/material.dart';
import 'package:izwebacademy_app/builders/page_route_builder.dart';
import 'package:izwebacademy_app/pages/index.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';
import 'package:izwebacademy_app/support/loaders/loader.dart';
import 'package:izwebacademy_app/support/logo/logo_holder.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      //Navigator.pushReplacementNamed(context, Routes.loginUrl);
      Navigator.pushReplacement(context, SlideRightRoute(page: LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.bgColor,
              AppColors.bgColor,
              AppColors.bgColor,
              AppColors.bgColor,
              Colors.white54,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LogoHolder(
              alt: false,
            ),
            Loader(),
          ],
        ),
      ),
    );
  }
}
