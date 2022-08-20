/*
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/presentation/screens/HomeScreen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signup(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/drive',
    ],
  );
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;

    if (result != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }  // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}*/
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/presentation/screens/HomeScreen/home_screen.dart';

class SignInWithGoogle extends StatefulWidget {
  @override
  _SignInWithGoogleState createState() => _SignInWithGoogleState();
}

class _SignInWithGoogleState extends State<SignInWithGoogle> {
  bool _isLoggedIn = false;
  GoogleSignInAccount? _userObj;
  GoogleSignIn? _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Codesundar")),
      body: Container(
        child: _isLoggedIn
            ? Column(
          children: [
            Image.network("${_userObj!.photoUrl}"),
            Text("${_userObj!.displayName}"),
            Text(_userObj!.email),
            TextButton(
                onPressed: () {
                  _googleSignIn?.signOut().then((value) {
                    setState(() {
                      _isLoggedIn = false;
                    });
                  }).catchError((e) {});
                },
                child: Text("Logout",style: textStyle(color: Colors.red),))
          ],
        )
            : Center(
          child: ElevatedButton(
            child: Text("Login with Google"),
            onPressed: () {
              _googleSignIn?.signIn().then((userData) {
                setState(() {
                  _isLoggedIn = true;
                  _userObj = userData!;
                });
                print('ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));

              }).catchError((e) {
                print('Errrrrrrrrror: $e');
              });
            },
          ),
        ),
      ),
    );
  }
}