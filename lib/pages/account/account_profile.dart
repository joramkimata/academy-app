import 'package:flutter/material.dart';
import 'package:izwebacademy_app/widgets/header/header.dart';

class AccountProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: Text('Profile'),
    );
  }
}
