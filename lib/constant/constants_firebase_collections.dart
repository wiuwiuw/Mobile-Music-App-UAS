import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollectionConstants {
  static CollectionReference getUserCollection() {
    return FirebaseFirestore.instance.collection('users');
  }

  static CollectionReference getProductCollection() {
    return FirebaseFirestore.instance.collection("products");
  }

  static CollectionReference getPlaylistCollection() {
    return FirebaseFirestore.instance.collection("playlist");
  }

  static CollectionReference getMusikCollection() {
    return FirebaseFirestore.instance.collection("musik");
  }

  static CollectionReference getPenyanyiCollection() {
    return FirebaseFirestore.instance.collection("penyanyi");
  }
}
