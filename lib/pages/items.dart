import 'package:flutter/material.dart';
import 'package:team2/navigation/navbar.dart';
import 'package:team2/pages/date_item.dart';
import 'package:team2/style/center_view.dart';
import 'package:getwidget/getwidget.dart';

List<String> dates = [];
List<String> items = [];
List<String> prices = [];

class ItemsPage extends StatelessWidget {
  final String date;
  final String item;
  final String price;
  const ItemsPage(this.date, this.item, this.price);
  Widget build(BuildContext context) {
    dates.add(date);
    items.add(item);
    prices.add(price);
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bluebg.jpg"), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
            itemCount: dates.length,
            itemBuilder: (BuildContext context, int index) {
              return GFAccordion(
                title: dates[index],
                content:
                    'Item: ' + items[index] + '\nPrice: \$' + prices[index],
                collapsedTitleBackgroundColor: Color.fromARGB(255, 143, 219, 255),
                expandedTitleBackgroundColor: Colors.lightBlue.shade200,
                contentBackgroundColor: Color.fromARGB(255, 186, 233, 255),
                textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              );
            }),
        bottomNavigationBar: Goback(context),
      )
    ]);
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.cyan[100],
  //     body: CenterView(
  //       child: Column(
  //         children: <Widget>[
  //          // NavigationBars(),
  //           // DatePrint(context),
  //           GFAccordion(
  //             title: dummy_date,
  //             content: 'Item: ' + dummy_item + '\nPrice: \$' + dummy_price,
  //             collapsedTitleBackgroundColor: Colors.lightBlue.shade50,
  //             expandedTitleBackgroundColor: Colors.lightBlue.shade200,
  //             contentBackgroundColor: Colors.lightBlue[50],
  //           ),
  //           GFAccordion(
  //             title: date,
  //             content: 'Item: ' + item + '\nPrice: \$' + price,
  //             collapsedTitleBackgroundColor: Colors.lightBlue.shade50,
  //             expandedTitleBackgroundColor: Colors.lightBlue.shade200,
  //             contentBackgroundColor: Colors.lightBlue[50],
  //           ),
  //           //ItemPrint(),
  //           //PricePrint(),
  //           Goback(context),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //  Widget DatePrint(context) => Center(
  //       child: Card(
  //         child: InkWell(
  //           splashColor: Colors.blue.withAlpha(30),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => DateItem(date,item,price)),
  //             );
  //           },
  //           child: SizedBox(
  //             width: 100,
  //             height: 50,
  //             child: Text(date),
  //           ),
  //         ),
  //       ),
  //     );

  //Widget ItemPrint() => Text(item);
  //Widget PricePrint() => Text(price);

  Widget Goback(context) => ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Back'),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 124, 218, 255),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      );
}
