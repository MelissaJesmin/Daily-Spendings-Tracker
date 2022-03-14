import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:team2/pages/home_screen.dart';

/*void main()  {
 /* WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  runApp(MyApp());
}
*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCLo_N07WYu5XaF3pN53Lq2CLs-69OM1to",
  authDomain: "flutterproject-d2174.firebaseapp.com",
  projectId: "flutterproject-d2174",
  storageBucket: "flutterproject-d2174.appspot.com",
  messagingSenderId: "621173847872",
  appId: "1:621173847872:web:6ec4e4fe50d5f4bf896ca5"
    ),
  );
  runApp( MyApp());
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
