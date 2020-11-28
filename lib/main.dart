import 'package:EventApp/Database/models/user.dart';
import 'package:EventApp/Presentation/detail_screen.dart';
import 'package:EventApp/Presentation/wrapper.dart';
import 'package:EventApp/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthSerivce().user,
      child: MaterialApp(
        home: Wrapper(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueGrey[600],
        ),
      ),
    );
  }
}
