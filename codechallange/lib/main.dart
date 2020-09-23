import 'package:codechallange/registrationPageWidget.dart';
import 'package:codechallange/signInWidget.dart';
import 'package:codechallange/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => User()),
        ],
        child: MaterialApp(
            title: 'Project',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SignInWidget()));
  }
}
