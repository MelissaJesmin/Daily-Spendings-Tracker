import 'package:flutter/material.dart';
import 'package:team2/pages/items.dart';
import '../src/blocs/entries_provider.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<HomePage> {
  final myDate = TextEditingController();
  final myItem = TextEditingController();
  final myPrice = TextEditingController();

  DateTime selectedDate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    final bloc = EntriesProvider.of(context);
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
              style: TextStyle(
                  color: Color.fromARGB(255, 141, 204, 255),
                  fontWeight: FontWeight.w700,
                  fontSize: 70,
                  height: 0.9),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            AddDate(),
            SizedBox(
              height: 30,
            ),
            AddItem(),
            SizedBox(
              height: 30,
            ),
            AddPrice(),
            SizedBox(
              height: 30,
            ),
            Button(bloc),
          ],
        ),
      ),
    );
  }

  Widget Button(EntriesBloc bloc) => ElevatedButton(
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
          bloc.addEntry(
              formatDate(selectedDate), int.parse(myPrice.text), myItem.text);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItemsPage()),
          );
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 168, 230, 255),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      );

  Widget AddDate() => TextFormField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_today,
                    color: Color.fromARGB(255, 188, 105, 202))),
            hintText: formatDate(selectedDate)),
        readOnly: true,
      );
  Widget AddItem() => TextFormField(
        controller: myItem,
        autofocus: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Enter the item'),
      );

  Widget AddPrice() => TextFormField(
        controller: myPrice,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Column(
                children: [Text("\$")],
                mainAxisAlignment: MainAxisAlignment.center),
            hintText: 'Enter the price'),
      );

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.input);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(formatDate(selectedDate));
      });
    }
  }

  String formatDate(DateTime date) => formatter.format(date);
}
