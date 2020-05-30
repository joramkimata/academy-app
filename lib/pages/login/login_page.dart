import 'package:flutter/material.dart';
import 'package:izwebacademy_app/builders/page_route_builder.dart';
import 'package:izwebacademy_app/io/user.dart';
import 'package:izwebacademy_app/models/auth_model.dart';
import 'package:izwebacademy_app/pages/index.dart';
import 'package:izwebacademy_app/support/inputs/form_input.dart';
import 'package:izwebacademy_app/support/links/navigation_link.dart';
import 'package:izwebacademy_app/support/logo/logo_holder.dart';
import 'package:izwebacademy_app/support/ui/action_button.dart';
import 'package:izwebacademy_app/support/ui/nav_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  Map<String, dynamic> _auth = Map<String, dynamic>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var authModel = Provider.of<AuthModel>(context);

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
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        FormInput(
                          labelText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (String value) {},
                          onSaved: (value) {
                            _auth["email"] = value;
                          },
                          sizeBoxHeight: 15.0,
                        ),
                        FormInput(
                          labelText: 'Password',
                          textInputType: TextInputType.text,
                          validator: (value) {},
                          obscureText: true,
                          onSaved: (value) {
                            _auth["password"] = value;
                          },
                          sizeBoxHeight: 10,
                        ),
                        NavLink(
                          onClick: () async {
                            //Navigator.pushNamed(
                            // context, Routes.resetPasswordUrl);

                            Navigator.push(context,
                                SlideRightRoute(page: ForgetPasswordPage()));
                          },
                          linkText: 'Forget Password',
                          sizedBoxHeight: 30,
                        ),
                        ActionButton(
                          onClick: () async {
                            //Navigator.pushReplacementNamed(context, Routes.homeUrl);

                            // Navigator.of(context)
                            //   .popUntil(ModalRoute.withName(Routes.loginUrl));

                            if (!_formKey.currentState.validate()) return;
                            _formKey.currentState.save();
                            setState(() {
                              _isLoading = true;
                            });
                            var map = await authModel.sigin(
                                _auth["email"], _auth["password"]);

                            if (map['status'] == 'error') {
                              setState(() {
                                _isLoading = false;
                              });
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    title: new Text("Sign In - Error"),
                                    content: new Text(map['message']),
                                    actions: <Widget>[
                                      // usually buttons at the bottom of the dialog
                                      new FlatButton(
                                        child: new Text("Close"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                              return;
                            }

                            var user = User.fromJson(map["data"]["user"]);
                            authModel.storeToken(user.token);

                            Navigator.pushReplacement(
                                context, SlideRightRoute(page: HomePage()));
                          },
                          labelText: 'Sign In',
                          isLoading: _isLoading,
                          sizedBoxHeight: 30,
                        ),
                        NavButton(
                          labelText: 'Create Account',
                          onClick: () {
                            //Navigator.pushNamed(context, Routes.registerUrl);
                            Navigator.push(
                                context, SlideRightRoute(page: RegisterPage()));
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
