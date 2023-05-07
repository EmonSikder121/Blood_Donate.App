import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static UserCredential? userCredential;
  static final _auth = FirebaseAuth.instance;
  static User? get currentUser => _auth.currentUser;


  static Future<UserCredential> register(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return credential;
  }

  static Future<UserCredential> login(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return credential;
  }

  static Future<void> logout() {
    return _auth.signOut();
  }
}