import 'package:flutter/material.dart';
import 'package:team2/navigation/navbar.dart';
import 'package:team2/pages/date_item.dart';
import 'package:team2/style/center_view.dart';

class ItemsPage extends StatelessWidget {
  final String date;
  final String item;
  final String price;
  const ItemsPage(this.date, this.item, this.price);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenterView(
        child: Column(
          children: <Widget>[
           // NavigationBars(),
            DatePrint(context),
           //DatePrint1 (context),
            //ItemPrint(),
            //PricePrint(),
            Goback(context),
          ],
        ),
      ),
    );
  }
 
   Widget DatePrint(context) => Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DateItem(date,item,price)),
              );
            },
            child: SizedBox(
              width: 100,
              height: 50,
              child: Text(date),
            ),
          ),
        ),
      );
  /*Widget DatePrint1 (context) => 
  Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DateItem(date,item,price)),
              );
            },
            child: SizedBox(
              width: 100,
              height: 50,
              child: Text(date),
            ),
          ),
        ),
      );*/
  //Widget ItemPrint() => Text(item);
  //Widget PricePrint() => Text(price);

  Widget Goback(context) => ElevatedButton(

        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Go Back!'),
      );
}

