import 'package:flutter/material.dart';
import 'package:izwebacademy_app/builders/page_route_builder.dart';
import 'package:izwebacademy_app/pages/index.dart';
import 'package:izwebacademy_app/support/inputs/form_input.dart';
import 'package:izwebacademy_app/support/links/navigation_link.dart';
import 'package:izwebacademy_app/support/logo/logo_holder.dart';
import 'package:izwebacademy_app/support/routes/routes.dart';
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
                          labelText: 'Full Name:',
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          obscureText: false,
                          onSaved: (value) {},
                          sizeBoxHeight: 20,
                        ),
                        FormInput(
                          labelText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (value) {},
                          onSaved: (value) {},
                          sizeBoxHeight: 20,
                        ),
                        FormInput(
                          labelText: 'Password',
                          textInputType: TextInputType.text,
                          obscureText: true,
                          validator: (value) {},
                          onSaved: (value) {},
                          sizeBoxHeight: 20,
                        ),
                        FormInput(
                          labelText: 'Confirm Password',
                          textInputType: TextInputType.text,
                          obscureText: true,
                          validator: (value) {},
                          onSaved: (value) {},
                        ),
                        NavLink(
                          onClick: () {
                            //Navigator.pushNamed(context, Routes.loginUrl);
                            Navigator.push(
                                context, SlideRightRoute(page: LoginPage()));
                          },
                          linkText: 'Already a member? Login',
                          sizedBoxHeight: 40,
                        ),
                        ActionButton(
                          labelText: 'Get Started',
                          onClick: () {},
                          isLoading: false,
                        ),
                        SizedBox(
                          height: 20.0,
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
