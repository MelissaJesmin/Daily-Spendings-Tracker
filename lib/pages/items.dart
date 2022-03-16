import 'package:flutter/material.dart';
// import 'package:team2/navigation/navbar.dart';

// import 'package:team2/style/center_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../src/blocs/entries_provider.dart';

import 'package:getwidget/getwidget.dart';

class ItemsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = EntriesProvider.of(context);
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bluebg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder<QuerySnapshot>(
            stream: bloc.entriesStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (!snapshot.hasData) {
                return Text('No data available');
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return GFAccordion(
                    title: "${data['date']}",
                    content: "Item: ${data['item']} \n\$${data['price']}",
                    collapsedTitleBackgroundColor:
                        Color.fromARGB(255, 143, 219, 255),
                    expandedTitleBackgroundColor: Colors.lightBlue.shade200,
                    contentBackgroundColor: Color.fromARGB(255, 186, 233, 255),
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  );
                }).toList(),
                padding: EdgeInsets.all(8),
              );
            }),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pop(context);
            }),
      )
    ]);
  }

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
