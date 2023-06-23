
import 'package:ewaste/Screen/user_Loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Function/color.dart';
import '../Widget/HomeScreenWidgrt.dart';
import 'dashboard.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgd,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
            print(FirebaseAuth.instance.currentUser);
          if(snapshot.connectionState==ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasData) {
            return Dash();
          } else if(snapshot.hasError) {
            return Center(child: Text("Some thing went wrong"),);
          } else {
            return HomePage();








              Container(
            child: Wrap(
              spacing:10,
              children: [
                TextButton(onPressed: (){
                  // final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                  // provider.googleLogin();
                }, child: Text("G sign_in Depretiated not working")),
                TextButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>Loginscreen()));

                }, child: Text("E-mail_signin"))
              ],
            ),
          );
          }
        }
      ),
    );
  }
}
