import 'package:flutter/material.dart';

class LogoHolder extends StatelessWidget {
  const LogoHolder({
    Key key,
    @required this.alt,
  }) : super(key: key);

  final bool alt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 180.0,
      padding: EdgeInsets.all(100),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: this.alt != true
              ? AssetImage('assets/logos/logo.jpg')
              : AssetImage('assets/logos/logo-2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
