import 'package:flutter/material.dart';
import 'package:team2/navigation/navbar.dart';
import 'package:team2/pages/home_page.dart';
import 'package:team2/style/center_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenterView(
        child: Column(
          children: <Widget>[
            //NavigationBars(),
            Expanded(
              child: Row(children: [
                HomePage(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
