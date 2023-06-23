import 'package:ewaste/Function/color.dart';
import 'package:ewaste/Widget/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screen/user_Loginscreen.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Palette.bgd,
                child: Row(
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width/3,
                      child:Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Together",style: GoogleFonts.signikaNegative(
                              fontSize:50, color: Palette.textd,),),
                          Text("We",style: GoogleFonts.signikaNegative(
                            fontSize: 50, color: Palette.textd,),),
                          Text("CLAIM",style: GoogleFonts.signikaNegative(
                            fontSize: 75, color: Palette.sucess,fontWeight: FontWeight.w900),),
                            SizedBox(height: 30,),
                            ButtonBold(onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>Loginscreen()));
                            }, text: "LOGIN")
                        ],),
                      ) ,
                    ),

                    Container(
                      height:MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width*2/3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 10,),
                          Container(
                            child: Row(
                              children: [
                                Text("IN",style: GoogleFonts.leagueGothic(
                                    fontSize:  270, color: Palette.main, height: 0.99,fontWeight: FontWeight.w900,letterSpacing: 20.5),),
                                Text("S",style: GoogleFonts.leagueGothic(
                                    fontSize:  250, color: Palette.blue, height: 0.99,fontWeight: FontWeight.w900,letterSpacing: 20.5),),
                                Text("I",style:  GoogleFonts.leagueGothic(
                                    fontSize:  250, color: Palette.blue, height: 0.99,fontWeight: FontWeight.w900,letterSpacing: 20.5),),
                                Text("S",style: GoogleFonts.leagueGothic(
                                    fontSize:  250, color: Palette.blue, height: 0.99,fontWeight: FontWeight.w900,letterSpacing: 20.5),),
                                Text("T",style: GoogleFonts.leagueGothic(
                                    fontSize:  250, color: Palette.blue, height: 0.99,fontWeight: FontWeight.w900,letterSpacing: 20.5),),

                              ],
                            ),
                          ),
                          SizedBox(width: 10,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Palette.main,
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
