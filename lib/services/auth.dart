import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on Firebase
  UserApp? _userFromFirebae(User? user) {
    return user != null ? UserApp(uid: user.uid) : null;
  }

  // sing-in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebae(user);
    } catch (error) {
      return error.toString();
    }
  }

  //TODO sign-in email

  //TODO register

  //TODO sign-out
}
