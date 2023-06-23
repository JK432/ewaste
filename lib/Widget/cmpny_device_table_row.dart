import 'package:ewaste/Function/crud.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Function/color.dart';
import '../Function/time.dart';
import '../Models/Device.dart';
import '../Screen/cmpny_deviceindividual.dart';
class CmpnyDeviceRow extends StatefulWidget {
  final Device device;
  final int no;
  final double width;
  const CmpnyDeviceRow({Key? key, required this.device, required this.no, required this.width}) : super(key: key);

  @override
  State<CmpnyDeviceRow> createState() => _CmpnyDeviceRowState();
}

// Type devicetype = Type();
// Cmpny company = Cmpny();
// Droppoint point = Droppoint();

class _CmpnyDeviceRowState extends State<CmpnyDeviceRow> {
  // callopt() async {
  //   devicetype = await readOnedtype(widget.device.typeid);
  //   if (widget.device.droppointid != "") {
  //     point = await readOnedroppoint(widget.device.droppointid);
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    //callopt();
    super.initState();
  }

  Widget build(BuildContext context) {
    double cellwidth= widget.width/20;
    //CmpnyDeviceScreen
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CmpnyDeviceScreen(device: widget.device,)));

      },
      child: Container(
        height: 35,
        width:widget.width,
        child: Row(children: [

          Container(
            width: cellwidth*1,
            child: Text("${widget.device.qnty}",style: GoogleFonts.signikaNegative(
                fontSize: 23.0, color: Palette.textd),),
          ),

          Container(
            width: cellwidth*5,
            child:  FutureBuilder(
                future: readOnedtype(widget.device.typeid),
                builder: (context, snapshot) {
                  if (snapshot != null && snapshot.hasData) {
                    return Text(snapshot.data!.type,style: GoogleFonts.signikaNegative(
                        fontSize: 23.0, color: Palette.textd),);
                  } else {
                    return Container();
                  }
                })






            ,
          ),
          Container(
            width: cellwidth*3,
            child: Text(widget.device.mode,style: GoogleFonts.signikaNegative(
                fontSize: 23.0, color: Palette.textd),),
          ),
          Container(
            width: cellwidth*3,
            child: Text(widget.device.filelink.length==0?"Not attached":"Available",style: GoogleFonts.signikaNegative(
                fontSize: 23.0, color: Palette.textd),),
          ),
          Container(
            width: cellwidth*3,
            child: Text(widget.device.status,style: GoogleFonts.signikaNegative(
                fontSize: 23.0, color: Palette.textd),),
          ),
          Container(
            width: cellwidth*5,
            child: Text(timefromepoch().millisecondsToDateTime(int.parse(widget.device.id)),style: GoogleFonts.signikaNegative(
                fontSize: 23.0, color: Palette.textd),),
          ), // Text("25", style: TextStyleOutput(fontSize: 15.0),),
        ]) as Widget,
      ),
    );
  }
}
