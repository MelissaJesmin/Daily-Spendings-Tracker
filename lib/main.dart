

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:team2/home/home.dart';
import 'package:team2/pages/home_screen.dart';
void main()  {
 /* WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: 'Open Sans',
                )),
        home: HomeScreen());
  }
}
