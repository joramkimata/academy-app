import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/inputs/form_input.dart';
import 'package:izwebacademy_app/support/logo/logo_holder.dart';
import 'package:izwebacademy_app/support/ui/action_button.dart';
import 'package:izwebacademy_app/support/ui/nav_button.dart';

class RegisterPage extends StatelessWidget {
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
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        FormInput(
                          labelText: 'Password',
                          textInputType: TextInputType.text,
                          obscureText: true,
                          validator: (value) {},
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ActionButton(
                          labelText: 'Sign In',
                          onClick: () {},
                          isLoading: false,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        NavButton(
                          labelText: 'Sign Up',
                        ),
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
