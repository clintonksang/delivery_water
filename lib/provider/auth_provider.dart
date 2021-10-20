import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:water_del/models/models.dart';
import 'package:water_del/provider/provider.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final Auth.FirebaseAuth auth;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Auth.User currentUser;
  String userImage;

  UserModel userModel;
  Status _status = Status.Uninitialized;
  final Timestamp now = Timestamp.now();
  DatabaseProvider database = DatabaseProvider();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthProvider.instance() : auth = Auth.FirebaseAuth.instance {
    auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Status get status => _status;
  Auth.User get user => currentUser;


  Future<void> _onAuthStateChanged(Auth.User firebaseUser,) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      currentUser = firebaseUser;
      Future.delayed(
        Duration(seconds: 1),
        () => database.setLastLogin(currentUser.uid, now),
      );
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  /*
  USER REGISTRATION
  */
  Future createUserEmailPass(UserModel user) async {
    _status = Status.Authenticating;
    notifyListeners();
    try {
      Auth.UserCredential result = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      currentUser = result.user;
  
      String uid = currentUser.uid;

      // //Log an Analytics Event signalling SIGN UP
      // await funnel.logSignUp(uid);

      currentUser.sendEmailVerification();

      //print('Positive Registration Response: ${currentUser.uid}');
      //Try adding the user to the Firestore
      await database.saveUser(user, uid);
      return Future.value(currentUser);
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      var response;
      if (e.toString().contains("ERROR_WEAK_PASSWORD")) {
        response = 'Your password is weak. Please choose another';
      }
      if (e.toString().contains("ERROR_INVALID_EMAIL")) {
        response = 'The email format entered is invalid';
      }
      if (e.toString().contains("ERROR_EMAIL_ALREADY_IN_USE")) {
        response = 'An account with the same email exists';
      }
      return response;
    }
  }

  /*
  USER LOGIN
  */
  Future signInEmailPass(UserModel user) async {
    _status = Status.Authenticating;
    notifyListeners();
    try {
      Auth.UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      currentUser = result.user;

      return Future.value(currentUser);
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      var response;

      // print('This is the response: $response');
      print('This is the error: $e');
      if (e.toString().contains("The password is invalid or the user does not have a password")) {
        response = 'The email or password entered is invalid';
      }
      if (e.toString().contains("There is no user record corresponding to this identifier. The user may have been deleted.")) {
        response = 'No user';
      }
      if (e.toString().contains("ERROR_USER_NOT_FOUND")) {
        response = 'The email entered does not exist';
      }
      if (e.toString().contains("ERROR_USER_DISABLED")) {
        response = 'The account you are trying to login to has been disabled';
      }
      if (e.toString().contains("ERROR_TOO_MANY_REQUESTS")) {
        response = 'Too many requests. Please try again later';
      }
    
      return response;
    }
  }

  /*
  USER PASSWORD RESET
  */
  Future resetPass(UserModel user) async {
    var response;
    try {
      await auth.sendPasswordResetEmail(email: user.email);
      // await funnel.logEvent('Password Reset', user.email);
      response = true;
      return response;
    } catch (e) {
      if (e.toString().contains("ERROR_INVALID_EMAIL")) {
        response = 'Invalid Email. Please enter the correct email';
        //print('Negative Response: $response');
      }
      if (e.toString().contains("ERROR_USER_NOT_FOUND")) {
        response = 'Please register first';
        //print('Negative Response: $response');
      }
      return response;
    }
  }

  /*
  USER LOGOUT
  */
  Future<void> logout() async {
    auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<Auth.User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final Auth.AuthCredential credential = Auth.GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      final Auth.UserCredential authResult =
          await auth.signInWithCredential(credential);
      final Auth.User user = authResult.user;

      UserModel model = new UserModel(
        photoUrl: user.photoURL,
        email: user.email,
        lastLogin: now,
        fullName: user.displayName,
      );

      db.collection('users').doc(user.uid).get().then((value) async {
        if (value.exists) {
          Future.delayed(Duration(seconds: 1),
              () => database.setLastLogin(currentUser.uid, now));
        } else {
          await database.saveUser(model, user.uid);
        }
      });
      return Future.value(user);
    } catch (e) {
      return null;
    }
  }

  getCurrentUser() {
    return currentUser;
  
  }
}
