import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key key,
    @required this.labelText,
    @required this.textInputType,
    @required this.validator,
    @required this.obscureText,
    @required this.onSaved,
    this.onChanged,
    this.sizeBoxHeight,
  }) : super(key: key);

  final String labelText;
  final TextInputType textInputType;
  final Function validator;
  final bool obscureText;
  final Function onSaved;
  final Function onChanged;
  final double sizeBoxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          obscureText: obscureText,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
          keyboardType: textInputType,
          decoration: InputDecoration(
            labelText: labelText,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppColors.bgColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppColors.bgColor,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: sizeBoxHeight == null ? 15.0 : sizeBoxHeight,
        )
      ],
    );
  }
}
