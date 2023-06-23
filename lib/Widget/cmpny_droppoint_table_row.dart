import 'package:ewaste/Function/crud.dart';
import 'package:ewaste/Models/Droppoint.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Function/color.dart';
import '../Models/Device.dart';
import 'Buttons.dart';
class CmpnyDropPointRow extends StatefulWidget {
  final Droppoint point;
  final double width;
  const CmpnyDropPointRow({Key? key, required this.point, required this.width}) : super(key: key);

  @override
  State<CmpnyDropPointRow> createState() => _CmpnyDropPointRowState();
}


class _CmpnyDropPointRowState extends State<CmpnyDropPointRow> {
  @override
  void initState() {
    // TODO: implement initState
    //callopt();
    super.initState();
  }

  Widget build(BuildContext context) {
    double cellwidth= widget.width/18;

    return Container(
      height: 30,
      width:widget.width,
      child: Row(children: [

        Container(
          width: cellwidth*4,
          child: Text("${widget.point.adress}",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),),
        ),

        Container(
          width: cellwidth*6,
          child:  Text("${widget.point.lat}",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),)

        ),
        Container(
          width: cellwidth*6,
          child: Text(widget.point.lon,style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),),
        ),
        Container(
          width: cellwidth*2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){openMap(widget.point.lat,widget.point.lon,context);},splashRadius: 1, icon: Icon(Icons.open_in_browser,color: Palette.textd,)),
              IconButton(onPressed: (){},splashRadius: 1, icon: Icon(Icons.delete,color: Palette.textd,))
            ],
          ),
        ),

      ]),
    );
  }
}
