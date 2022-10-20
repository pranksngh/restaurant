// ignore_for_file: file_names

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAPI {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> googleLogin() => _googleSignIn.signIn();
}
