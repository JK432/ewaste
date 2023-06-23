import 'dart:html';

import 'package:ewaste/Function/crud.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/Cmpny.dart';
import '../Models/Droppoint.dart';
import '../Function/color.dart';
import '../Models/DeviceType.dart';
import '../Models/Device.dart';
class CmpnyDeviceHead extends StatefulWidget {

  final double width;
  const CmpnyDeviceHead({Key? key, required this.width}) : super(key: key);

  @override
  State<CmpnyDeviceHead> createState() => _CmpnyDeviceHeadState();
}
class _CmpnyDeviceHeadState extends State<CmpnyDeviceHead> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double cellwidth= widget.width/20;

    return Container(
      decoration: BoxDecoration(color: Palette.main,borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,topRight:Radius.circular(10))),

      child: Padding(
        padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10,bottom: 8),
        child: Container(
          //decoration: BoxDecoration(color: Palette.bgl,borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,topRight:Radius.circular(10))),
          height: 30,
          width:widget.width,
          child: Row(children: [

            Container(
              width: cellwidth*1,
              child: Text("No",style: GoogleFonts.signikaNegative(
                  fontSize: 23.0, color: Palette.textd),),
            ),
            Container(
              width: cellwidth*5,
              child: Text("Model",style: GoogleFonts.signikaNegative(
                  fontSize: 23.0, color: Palette.textd),),
            ),
            Container(
              width: cellwidth*3,
              child: Text("Mode",style: GoogleFonts.signikaNegative(
                  fontSize: 23.0, color: Palette.textd),),
            ),
            Container(
              width: cellwidth*3,
              child: Text("Document",style: GoogleFonts.signikaNegative(
                  fontSize: 23.0, color: Palette.textd),),
            ),
            Container(
              width: cellwidth*3,
              child: Text("Status",style: GoogleFonts.signikaNegative(
                  fontSize: 23.0, color: Palette.textd),),
            ),
            Container(
              width: cellwidth*5,
              child: Text("Time",style: GoogleFonts.signikaNegative(
                  fontSize: 23.0, color: Palette.textd),),
            ), // Text("25", style: TextStyleOutput(fontSize: 15.0),),
          ]) as Widget,
        ),
      ),
    );
  }
}
