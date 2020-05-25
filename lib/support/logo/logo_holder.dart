import 'package:flutter/material.dart';

class LogoHolder extends StatelessWidget {
  const LogoHolder({
    Key key,
    @required this.alt,
  }) : super(key: key);

  final bool alt;
  @override
  Widget build(BuildContext context) {
    ImageProvider logo = AssetImage('assets/logos/app_logo.jpg');
    ImageProvider logo2 = AssetImage('assets/logos/app_logo-2.jpg');

    return Container(
      width: 180.0,
      height: 180.0,
      padding: EdgeInsets.all(100),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: this.alt != true ? logo : logo2,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
