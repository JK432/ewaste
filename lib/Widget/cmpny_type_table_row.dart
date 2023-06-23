import 'package:ewaste/Function/crud.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Function/alert.dart';
import '../Function/color.dart';
import '../Models/DeviceType.dart';
class CmpnyTypeRow extends StatefulWidget {
  final Type type;
  final double width;
  const CmpnyTypeRow({Key? key, required this.type, required this.width}) : super(key: key);

  @override
  State<CmpnyTypeRow> createState() => _CmpnyTypeRowState();
}


class _CmpnyTypeRowState extends State<CmpnyTypeRow> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    double cellwidth= widget.width/3;

    return Container(
      height: 30,
      width:widget.width,
      child: Row(children: [
        Container(
          width: cellwidth*2,
          child: Text(widget.type.type,style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),),
        ),
        Container(
          width: cellwidth*1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){upadeTypeAlert(context,widget.type);},splashRadius: 1, icon: Icon(Icons.edit,color: Palette.textd,)),
              IconButton(onPressed: (){},splashRadius: 1, icon: Icon(Icons.delete,color: Palette.textd,))
            ],
          ),
        ),


      ]),
    );
  }
}
