import 'package:ewaste/Function/color.dart';
import 'package:flutter/material.dart';

import '../Models/Cmpny.dart';
import '../Widget/cmpny_cmpnycard.dart';
import '../Widget/user_cmpny_points_card.dart';
class CmpnyInfopage extends StatefulWidget {
  final Cmpny cmpny;
  const CmpnyInfopage({Key? key,required this.cmpny}) : super(key: key);

  @override
  State<CmpnyInfopage> createState() => _CmpnyInfopageState();
}

class _CmpnyInfopageState extends State<CmpnyInfopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgd,
      body: Container(height: MediaQuery.of(context).size.height,child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CmpnyCmpnyCard(cid: widget.cmpny.id,),
          ),
        ),
      ),),
    );
  }
}
