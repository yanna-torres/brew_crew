import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
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

  /// Brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: (doc.data() as Map)['name'] ?? '',
        strength: (doc.data() as Map)['strengh'] ?? 0,
        sugars: (doc.data() as Map)['sugars'] ?? '0',
      );
    }).toList();
  }

  /// Get brews streams
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  /// User Data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid!,
      name: snapshot['name'],
      sugars: snapshot['sugars'],
      strengh: snapshot['strengh'],
    );
  }

  /// Get user doc stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
