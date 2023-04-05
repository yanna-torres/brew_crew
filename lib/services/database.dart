import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  /// Collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData({
    required String sugars,
    required String name,
    required int strengh,
  }) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strengh': strengh,
    });
  }

  /// Get brews streams
  Stream<QuerySnapshot?> get brews {
    return brewCollection.snapshots();
  }
}
