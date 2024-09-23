import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:service/service/authentication.dart';

export '';

class getData {
  static String userName = "";
  static String imageUrl = "";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> dataFetch() async {
    final docRef = _firestore.collection("profile").doc(AuthServices.uidUser);

// Source can be CACHE, SERVER, or DEFAULT.
    const source = Source.cache;

    docRef.get(const GetOptions(source: source)).then(
          (res) => print("Successfully completed"),
          onError: (e) => print("Error completing: $e"),
        );
  }
}
