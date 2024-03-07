import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollectionReferance {
  users;

  CollectionReference get ref => FirebaseFirestore.instance.collection(name);
}
