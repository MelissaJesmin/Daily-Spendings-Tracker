import 'package:cloud_firestore/cloud_firestore.dart';

class EntriesBloc {
  final Stream<QuerySnapshot> _entriesStream =
      FirebaseFirestore.instance.collection('entries').snapshots();

  Stream<QuerySnapshot> get entriesStream => _entriesStream;
}
