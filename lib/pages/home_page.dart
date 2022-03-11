import 'package:flutter/material.dart';
import 'package:team2/firestore/database.dart';
import 'package:team2/pages/items.dart';


/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

}*/
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<HomePage> {
  List dataList = [];
  final myDate = TextEditingController();
  final myItem = TextEditingController();
  final myPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Daily Spendings Tracker',
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 80, height: 0.9),
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
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ItemsPage(myDate.text, myItem.text, myPrice.text)),
          );
     

          /*FirebaseFirestore.instance
              .collection('data')
              .add({'item': 'data added'});*/
        },
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
