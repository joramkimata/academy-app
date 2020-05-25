import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';

class NavLink extends StatelessWidget {
  final Function onClick;
  final String linkText;
  final double fontSize;
  final double sizedBoxHeight;

  const NavLink({
    Key key,
    @required this.onClick,
    @required this.linkText,
    this.fontSize,
    this.sizedBoxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onClick,
                child: Text(
                  linkText,
                  style: TextStyle(
                    color: AppColors.bgColor,
                    decoration: TextDecoration.underline,
                    fontSize: fontSize == null ? 28 : fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: sizedBoxHeight == null ? 10 : sizedBoxHeight,
        ),
      ],
    );
  }
}
