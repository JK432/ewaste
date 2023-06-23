import 'dart:html';

import 'package:ewaste/Function/crud.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/Cmpny.dart';
import '../Models/Droppoint.dart';
import '../Function/color.dart';
import '../Models/DeviceType.dart';
import '../Models/Device.dart';
class CmpnyTypeHead extends StatefulWidget {

  final double width;
  const CmpnyTypeHead({Key? key, required this.width}) : super(key: key);

  @override
  State<CmpnyTypeHead> createState() => _CmpnyTypeHeadState();
}
class _CmpnyTypeHeadState extends State<CmpnyTypeHead> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double cellwidth= widget.width/3;

    return Container(
      decoration: BoxDecoration(color: Palette.main,borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,topRight:Radius.circular(0))),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10,bottom: 8),
        child: Container(
          height: 30,
          width:widget.width,
          child: Row(children: [

            Container(
              width: cellwidth*2,
              child: Text("Type",style: GoogleFonts.signikaNegative(
                  fontSize: 23.0, color: Palette.textd),),
            ),
            Container(
              width: cellwidth*1,
              child: Text("Function",style: GoogleFonts.signikaNegative(
                  fontSize: 23.0, color: Palette.textd),),
            ), // Text("25", style: TextStyleOutput(fontSize: 15.0),),
          ]) as Widget,
        ),
      ),
    );
  }
}
