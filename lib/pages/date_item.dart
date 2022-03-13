import 'package:flutter/material.dart';
import 'package:team2/style/center_view.dart';

import '../navigation/navbar.dart';

class DateItem extends StatelessWidget {
  final String date;
  final String item;
  final String price;
  const DateItem(this.date, this.item, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenterView(
        child: Column(
          children: <Widget>[
            //NavigationBars(),
            DatePrint(),
            ItemPrint(),
            PricePrint(),
            Goback(context)

          ],
        ),
      ),
    );
  }
  Widget DatePrint() => Text(
            date,
            style: TextStyle(

                fontWeight: FontWeight.w800, fontSize: 80, height: 0.9
                ),
          );
  
  Widget ItemPrint() => Text(item,
            
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 20, height: 2),
                );

  Widget PricePrint() => Text(price);

  Widget Goback(context) => ElevatedButton(
      
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Go Back!'),
      );
  
}

