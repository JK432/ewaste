
import 'package:flutter/foundation.dart';

import 'package:ewaste/Screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Function/color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _intialization =Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDX5L_lDVOVQ6EJDPDRLADWU8X2N_OLYbQ",
            authDomain: "ewaste-7b2fd.firebaseapp.com",
            projectId: "ewaste-7b2fd",
            storageBucket: "ewaste-7b2fd.appspot.com",
            messagingSenderId: "432036964590",
            appId: "1:432036964590:web:c0c655e5acce40e32f2bff"
        ));
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)=>MaterialApp(
      title: 'ewaste',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: TextTheme(button: TextStyle(color: Palette.textd)),
        iconTheme: IconThemeData(color: Colors.deepOrange),

        backgroundColor: Palette.bgd
      ),
      home: FutureBuilder(
        future: _intialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print(snapshot.stackTrace);
            }
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Home();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

  );


}


