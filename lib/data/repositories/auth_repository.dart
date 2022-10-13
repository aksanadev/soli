import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw Exception("An account already exists using this email");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("No user found with this email");
      } else if (e.code == 'wrong-password') {
        throw Exception("Incorrect password");
      }
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
