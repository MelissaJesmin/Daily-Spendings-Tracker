import 'package:cloud_firestore/cloud_firestore.dart';

class EntriesBloc {
  final Stream<QuerySnapshot> _entriesStream =
      FirebaseFirestore.instance.collection('entries').snapshots();

  // Create a CollectionReference called entries that references the firestore collection
  CollectionReference entries =
      FirebaseFirestore.instance.collection('entries');

  Stream<QuerySnapshot> get entriesStream => _entriesStream;

  Future<void> addEntry(String date, int price, String item) {
    return entries
        .add({'price': price, 'date': date, 'item': item})
        .then((value) => print("entry added"))
        .catchError((error) => print("Failed to add entry: $error"));
  }
}
