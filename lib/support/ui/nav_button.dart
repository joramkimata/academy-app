import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    Key key,
    @required this.labelText,
    @required this.onClick,
    this.sizedBoxHeight,
  }) : super(key: key);

  final String labelText;
  final Function onClick;
  final double sizedBoxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 60,
          child: FlatButton(
            child: Text(
              labelText,
              style: TextStyle(color: AppColors.bgColor, fontSize: 26),
            ),
            onPressed: onClick,
          ),
        ),
        SizedBox(
          height: sizedBoxHeight == null ? 15 : sizedBoxHeight,
        ),
      ],
    );
  }
}
