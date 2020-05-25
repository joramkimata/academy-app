import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';
import 'package:izwebacademy_app/support/loaders/loader.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
    @required this.onClick,
    @required this.labelText,
    @required this.isLoading,
    this.sizedBoxHeight,
  }) : super(key: key);

  final Function onClick;
  final String labelText;
  final bool isLoading;
  final double sizedBoxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.bgColor,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: isLoading
                    ? Loader()
                    : Text(
                        labelText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: sizedBoxHeight == null ? 15 : sizedBoxHeight,
        ),
      ],
    );
  }
}
