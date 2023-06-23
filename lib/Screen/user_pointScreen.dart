import 'package:ewaste/Function/auth.dart';
import 'package:ewaste/Models/Cmpny.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Function/color.dart';
import '../Function/crud.dart';
import '../Widget/Buttons.dart';
import '../Widget/user_cmpny_points_card.dart';
class UserPointScreen extends StatefulWidget {
  const UserPointScreen({Key? key}) : super(key: key);

  @override
  State<UserPointScreen> createState() => _UserPointScreenState();
}

class _UserPointScreenState extends State<UserPointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgd,
      body: SingleChildScrollView(
        child:   Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              children: [Expanded(child: Container()),ButtonText(onTap: ()async{
                await Authentication().signOut(context);
                Navigator.of(context).pop();
              },text: "LogOut",),SizedBox(width: 20,)],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<List<Cmpnyid>>(
                stream: readcompanypointsforUser(),
                builder: (context, snapshot) {
                  print(Authentication().userData().uid);
                  print(snapshot.error);
                  if (snapshot.hasData) {
                    final cid = snapshot.data;
                    if (cid == null || cid.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top:40,right: 20,left: 20),
                          child: Container(
                            child: Center(child: Text("Sorry! No points till Now.",style: GoogleFonts.signikaNegative(
                                fontSize: 30.0, color: Palette.main))),),
                        ),
                      );
                    } else {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left:40,right:40,top: 30),
                          child: Column(
                            children: cid.map(buildItem).toList(),
                          ),
                        ),
                      );

                    }
                  }

                  if (snapshot.hasError) {
                    print("error");
                    print(snapshot.error);
                    print(snapshot.stackTrace);
                    return Container(child: Text("error"),);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: Palette.main),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildItem(Cmpnyid cid) {
    return UserCmpnypointsCard(
      cid: cid.cmpnyid,

    );
  }

}
//UserCmpnypointsCard