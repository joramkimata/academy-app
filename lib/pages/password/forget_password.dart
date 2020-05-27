import 'package:flutter/material.dart';
import 'package:izwebacademy_app/builders/page_route_builder.dart';
import 'package:izwebacademy_app/pages/index.dart';
import 'package:izwebacademy_app/support/inputs/form_input.dart';
import 'package:izwebacademy_app/support/logo/logo_holder.dart';
import 'package:izwebacademy_app/support/routes/routes.dart';
import 'package:izwebacademy_app/support/ui/action_button.dart';
import 'package:izwebacademy_app/support/ui/nav_button.dart';

class ForgetPasswordPage extends StatelessWidget {
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
                        Row(
                          children: <Widget>[
                            Text(
                              "Enter your email to reset password",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormInput(
                          labelText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (value) {},
                          onSaved: (value) {},
                          sizeBoxHeight: 20,
                        ),
                        ActionButton(
                          labelText: 'Send Reset Email',
                          onClick: () {},
                          isLoading: false,
                          sizedBoxHeight: 20,
                        ),
                        NavButton(
                            labelText: 'Create Account',
                            onClick: () {
                              //Navigator.pushNamed(context, Routes.registerUrl);
                              Navigator.push(context,
                                  SlideRightRoute(page: RegisterPage()));
                            }),
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
