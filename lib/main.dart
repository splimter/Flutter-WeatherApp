import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'blocs/bloc.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new SplashScreen(
            seconds: 3,
            navigateAfterSeconds: ChangeNotifierProvider<Bloc>(
              builder: (_) => Bloc(),
              child: Home(),
            ),
            title: new Text(
              'Weather App',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 48,
              ),
            ),
            image: new Image.asset('ssbg.png'),
            backgroundColor: Colors.white,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 100.0,
            loaderColor: Colors.red));
  }
}
