import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewaste/Models/Cmpny.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Models/NormalUser.dart';
import '../Widget/snackbar.dart';

class user {
  String email = "";
  String uid = "";
  user(String email, String uid) {
    this.email = email;
    this.uid = uid;
  }
}

class Authentication {


  Stream<User?> authState() {
    return FirebaseAuth.instance.authStateChanges();
  }

  user userData() {
    String? e = FirebaseAuth.instance.currentUser?.email;
    String? u = FirebaseAuth.instance.currentUser?.uid;
    user U = user(e == null ? "" : e, u == null ? "" : u);
    return U;
  }

  Future signIn(String email, String password, BuildContext context) async {
    print(email);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {Navigator.of(context).pop()});
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar().snackBarSucess("Signed In"));
    } on FirebaseAuthException catch (e) {
      String msg = e.message!;
      if (msg != null)
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarFail(msg));
      else {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarFail("Error"));
      }
    } catch (e) {
      print(e);
    }
  }

  Future signUp(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar().snackBarSucess("Signed Out"));
    } on FirebaseAuthException catch (e) {
      String msg = e.message!;
      if (msg != null)
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarFail(msg));
      else {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarFail("Error"));
      }
    } catch (e) {
      print(e);
    }
  }

  Future Createuser(
      {required String roll,
      required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await signUp(email, password).then((value) {
        final u1 = Authentication().userData();
        final uuser = Uuser(
          roll: roll,
          total: "0",
          uid: u1.uid,
        );
        final json = uuser.toJson();
        FirebaseFirestore.instance
            .collection("users")
            .doc(u1.uid)
            .set(json)
            .then((value) => null);
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar().snackBarSucess("Account Created"));
    } on FirebaseAuthException catch (e) {
      String msg = e.message!;
      if (msg != null)
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarFail(msg));
      else {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarFail("Error"));
      }
    } catch (e) {
      print(e);
    }
  }

  Stream<Uuser> readUser() {
    String uid = Authentication().userData().uid;
    print(uid);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((snapshot) =>
            Uuser.fromJson(snapshot.data() as Map<String, dynamic>));
  }

  Future SignUpCompany(
      {required String email,
      required String name,
        required String password,
      required String website,
      required String ppolicy,
        required BuildContext context,
      required String imgurl}) async {

    try {
      await signUp(email, password).then((value) {
        final u1 = Authentication().userData();
        final uuser = Uuser(
          roll: "cmpny",
          total: "0",
          uid: u1.uid,
        );
        final json = uuser.toJson();
        FirebaseFirestore.instance
            .collection("users")
            .doc(u1.uid)
            .set(json)
            .then((value) => null);


        final cmpny = Cmpny(email:email ,id:u1.uid ,name:name ,url: website,imgurl: imgurl,privacypolicy: ppolicy,);
        final cjson = cmpny.toJson();
        FirebaseFirestore.instance
            .collection("cmpny")
            .doc(u1.uid)
            .set(cjson)
            .then((value){Navigator.of(context).pop();});

      });




      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar().snackBarSucess("Account Created"));
    } on FirebaseAuthException catch (e) {
      String msg = e.message!;
      if (msg != null)
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarFail(msg));
      else {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar().snackBarFail("Error"));
      }
    } catch (e) {
      print(e);
    }

  }
}
