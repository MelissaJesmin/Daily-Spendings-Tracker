import 'package:flutter/material.dart';
import './src/app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDr-w9fi2uwHmOgMhAiRHOOr2UkmGooRck",
          authDomain: "group-7-flutter-tracker.firebaseapp.com",
          projectId: "group-7-flutter-tracker",
          storageBucket: "group-7-flutter-tracker.appspot.com",
          messagingSenderId: "862456949663",
          appId: "1:862456949663:web:bd48c4a6074241cd9e2baa",
          measurementId: "G-2BB2LPMYXL"));
  runApp(App());
}
