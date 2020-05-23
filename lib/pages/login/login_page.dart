import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';
import 'package:izwebacademy_app/support/loaders/loader.dart';
import 'package:izwebacademy_app/support/logo/logo_holder.dart';

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
                        TextFormField(
                          validator: (value) {
                            if (value.trim().length <= 0) {
                              return 'Email is required!';
                            }
                          },
                          onSaved: (String value) {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
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
                          height: 15.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.trim().length <= 0) {
                              return 'Password is required!';
                            }
                          },
                          onSaved: (String value) {},
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
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
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: AppColors.bgColor,
                                decoration: TextDecoration.underline,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.bgColor,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isLoading = !_isLoading;
                              });
                            },
                            child: Center(
                              child: _isLoading
                                  ? Loader()
                                  : Text(
                                      'Sign In',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 26),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: FlatButton(
                            child: Text(
                              "Sign Up!",
                              style:
                                  TextStyle(color: AppColors.bgColor, fontSize: 26),
                            ),
                            onPressed: () {},
                          ),
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
