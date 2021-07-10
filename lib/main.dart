import 'package:flutter/material.dart';

import 'views/pages/HomePage.dart';
import 'views/pages/LoginPage.dart';
import 'views/pages/ListPage.dart';
import 'package:qualif/utils/globals.dart' as globals;

void main() {
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: globals.darkTheme ?ThemeData.dark() : ThemeData.light(),
      home:Scaffold(
        body: LoginPage(),
      ),
    );
  }

}
