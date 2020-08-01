import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/views/account.dart';
// import 'package:flutter_app/views/home.dart';
// import 'package:flutter_app/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // IMPL SIGN-IN WITH GOOGLE A/C
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> handleSignIn() async {
    print('YAHA PE # 01');
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      print('YAHA PE # 02');
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      print('YAHA PE # 03');

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print('YAHA PE # 04');

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      print('YAHA PE # 05');
      print("signed in " + user.displayName);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // IMPL SIGN-OUT
  Future<Account> signOut() async {
    await _auth.signOut();
    // await _auth.currentUser();
    // await _googleSignIn.signOut();
    // await _googleSignIn.signOut();
    return Account();
  }
  // IMPL PHONE SIGN-IN

}
