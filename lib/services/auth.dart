import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// create user object based on Firebase
  UserApp? _userFromFirebae(User? user) {
    return user != null ? UserApp(uid: user.uid) : null;
  }

  /// auth change user stream
  Stream<UserApp?> get user {
    return _auth.authStateChanges().map(_userFromFirebae);
  }

  /// sing-in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebae(user);
    } catch (error) {
      return error.toString();
    }
  }

  /// sign-in with email and password
  Future loginEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? newUser = result.user;
      return _userFromFirebae(newUser);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  /// register with email and password
  Future registerEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? newUser = result.user;
      return _userFromFirebae(newUser);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  /// sign-out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
