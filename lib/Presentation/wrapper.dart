import 'package:EventApp/Database/models/user.dart';
import 'package:EventApp/Presentation/authenticate/authenticate.dart';
import 'package:EventApp/Presentation/home.dart/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    //return Home or Authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
