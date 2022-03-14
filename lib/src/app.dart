import 'package:flutter/material.dart';
import 'blocs/entries_provider.dart';
import '../home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntriesProvider(
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Theme.of(context).textTheme.apply(
                    fontFamily: 'Open Sans',
                  )),
          home: HomeView()),
    );
  }
}
