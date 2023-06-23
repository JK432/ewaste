import 'package:ewaste/Function/auth.dart';
import 'package:ewaste/Function/color.dart';
import 'package:ewaste/Screen/admin_Addcompany.dart';
import 'package:ewaste/Screen/admin_addtype_ad.dart';
import 'package:ewaste/Screen/user_homescreen.dart';

import 'package:flutter/material.dart';

import '../Models/NormalUser.dart';
import 'admin_addDroppoint.dart';
import 'cmpny_homepage.dart';
import 'user_adddevice.dart';
class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgd,
      body: StreamBuilder<Uuser>(
        stream: Authentication().readUser(),
        builder: (context, snapshot) {
          if(snapshot.hasError){

            print(snapshot.stackTrace);
            //TODO: add Error widget
            return const Text("Error");}
          else if(snapshot.connectionState==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          else if(snapshot.hasData){
            if(snapshot.data?.roll=="Nuser"){

              return const UserHomeScreen();
            }
            else if(snapshot.data?.roll=="Admin"){
              return Container(child:Column(children: [
                const Text("Admin"),
                TextButton(onPressed: (){
                  Authentication().signOut(context);
                }, child: const Text("Sign out"))
              ],),);
            }
            else if(snapshot.data?.roll=="cmpny"){
              return const CmpnyHomepage();
            }

            //board user area


            else if(snapshot.data?.roll=="boardM"){
              return Container(child:Column(children: [
                const Text("Board Member"),
                TextButton(onPressed: (){
                  Authentication().signOut(context);
                }, child: const Text("Sign out")),
                const SizedBox(height: 10,),
                TextButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>const Addtype()));
                }, child: const Text("Add Type")),
                TextButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddDroppoint()));
                }, child: const Text("Add Droppoint")),
                //Adding company name
                //
                //

                // TextButton(onPressed: (){
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>AddCmpny()));
                // }, child: Text("Add a Company")),
              ],),);
            }
            else if(snapshot.data?.roll=="Collector"){
              return Container(child:Column(children: [
                const Text("Collector"),
                TextButton(onPressed: (){
                  Authentication().signOut(context);
                }, child: const Text("Sign out"))
              ],),);
            }
            else{
              return const Text("unexpected posibilty");
              //TODO: handle this with  a widget.
            }
          }
          else{
            return const Text("unexpected posibilty");
            //TODO: handle this with  a widget.
          }

        }

      ),
    );
  }


}
