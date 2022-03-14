import 'package:cloud_firestore/cloud_firestore.dart';

class EntryModel {
  final int id;
  final String date;
  final int price;
  final String item;

  EntryModel(this.id, this.date, this.price, this.item);

  factory EntryModel.fromDB(DocumentSnapshot document) {
    Map<String, dynamic> entry = document.data()! as Map<String, dynamic>;

    return EntryModel(
        entry['id'], entry['date'], entry['price'], entry['item']);
  }
}
