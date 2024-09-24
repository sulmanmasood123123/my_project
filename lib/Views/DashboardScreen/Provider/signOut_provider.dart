import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutProvider with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void signOut() async {
    await auth.signOut();
  }
}
