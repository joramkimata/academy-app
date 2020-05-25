import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';
import 'package:izwebacademy_app/support/inputs/form_input.dart';
import 'package:izwebacademy_app/support/links/navigation_link.dart';
import 'package:izwebacademy_app/support/loaders/loader.dart';
import 'package:izwebacademy_app/support/logo/logo_holder.dart';
import 'package:izwebacademy_app/support/routes/routes.dart';
import 'package:izwebacademy_app/support/ui/action_button.dart';
import 'package:izwebacademy_app/support/ui/nav_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LogoHolder(
                alt: true,
              ),
              Center(
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        FormInput(
                          labelText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (value) {},
                          onSaved: (value) {},
                          sizeBoxHeight: 15.0,
                        ),
                        FormInput(
                          labelText: 'Password',
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          obscureText: true,
                          onSaved: (value) {},
                          sizeBoxHeight: 10,
                        ),
                        NavLink(
                          onClick: () {
                            Navigator.pushNamed(
                                context, Routes.resetPasswordUrl);
                          },
                          linkText: 'Forget Password',
                          sizedBoxHeight: 30,
                        ),
                        ActionButton(
                          onClick: () {
                            Navigator.pushReplacementNamed(context, Routes.homeUrl);
                          },
                          labelText: 'Sign In',
                          isLoading: false,
                          sizedBoxHeight: 30,
                        ),
                        NavButton(
                          labelText: 'Create Account',
                          onClick: () {
                            Navigator.pushNamed(context, Routes.registerUrl);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
