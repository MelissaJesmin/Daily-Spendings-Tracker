import 'package:flutter/material.dart';
import 'package:team2/firestore/database.dart';
import 'package:team2/pages/items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<HomePage> {
  final myDate = TextEditingController();
  final myItem = TextEditingController();
  final myPrice = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 500.0),
      child: Container(
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Daily Spendings Tracker',
              style: TextStyle(color: Color.fromARGB(255, 141, 204, 255),
                  fontWeight: FontWeight.w700, fontSize: 70, height: 0.9), textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            AddDate(),
            AddItem(),
            AddPrice(),
            Button(),
          ],
        ),
      ),
    );
  }

  Widget Button() => ElevatedButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        child: Text(
          'Add item',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        onPressed: () {
                FireStoreDataBase().addStudents(myDate.text,myItem.text, myPrice.text);
                setState(() {});
              },
        /*onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ItemsPage(myDate.text, myItem.text, myPrice.text)),
          );

          /*FirebaseFirestore.instance
              .collection('data')
              .add({'item': 'data added'});*/
        },*/

        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 168, 230, 255),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      );

  Widget AddDate() => TextFormField(
        controller: myDate,
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Enter the date'),
      );
  Widget AddItem() => TextFormField(
        controller: myItem,
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Enter the item'),
      );
  Widget AddPrice() => TextFormField(
        controller: myPrice,
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Enter the price'),
      );
}
