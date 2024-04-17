import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollectionReferance {
  
  finances,
  users;

  CollectionReference get ref => FirebaseFirestore.instance.collection(name);
}
