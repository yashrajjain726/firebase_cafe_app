import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // Collection Reference
  final CollectionReference cafeCollection =
      FirebaseFirestore.instance.collection('cafe');
}
