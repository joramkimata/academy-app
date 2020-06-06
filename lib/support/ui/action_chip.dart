import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';
import 'package:izwebacademy_app/support/loaders/loader.dart';

class ActionChip extends StatelessWidget {
  final Function onClick;
  final String labelText;
  final bool isLoading;
  final double sizedBoxHeight;

  const ActionChip(
      {Key key,
      this.onClick,
      this.labelText,
      this.isLoading,
      this.sizedBoxHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColors.bgColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onClick,
          child: Center(
            child: isLoading
                ? Loader()
                : Text(
                    labelText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
