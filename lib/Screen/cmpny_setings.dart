import 'package:ewaste/Models/Droppoint.dart';
import 'package:ewaste/Screen/cmpny_homepage.dart';
import 'package:ewaste/Widget/Buttons.dart';
import 'package:ewaste/Widget/cmpny_type_table_head.dart';
import 'package:ewaste/Widget/cmpny_type_table_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Function/alert.dart';
import '../Function/color.dart';
import '../Function/crud.dart';
import '../Models/Cmpny.dart';
import '../Models/DeviceType.dart';
import '../Widget/cmpny_dropipoint_tablehead.dart';
import '../Widget/cmpny_droppoint_table_row.dart';
class CmpnySettings extends StatefulWidget {
 final Cmpny cmpny;
  const CmpnySettings({Key? key,required this.cmpny}) : super(key: key);

  @override
  State<CmpnySettings> createState() => _CmpnySettingsState();
}

class _CmpnySettingsState extends State<CmpnySettings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            width: MediaQuery.of(context).size.width-300,
            child: StreamBuilder<List<Droppoint>>(
              stream: readDroppointcmpny(widget.cmpny.id) ,
              builder: (context, snapshot) {
                print(snapshot.error);
                if (snapshot.connectionState != ConnectionState.waiting && snapshot.hasData) {
                  List <Droppoint> point = snapshot.data!;
                  print(snapshot.error);
                  if (point == null || point.isEmpty) {
                    return Column(
                      children: <Widget>[
                        CmpnyDroppointTablehead(
                          width: MediaQuery.of(context).size.width-350,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10,bottom: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 350,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "No point added",
                                          style: GoogleFonts.signikaNegative(
                                              fontSize: 23.0, color: Palette.textd),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20,right: 0,bottom: 0),
                          child: Container(
                              width: MediaQuery.of(context).size.width-350,

                              child: Row(children: [Expanded(child: Container()),Container(
                                  height:45,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight:Radius.circular(10) ,topLeft:Radius.circular(10) ),color: Palette.main),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                                    child: ButtonBold(onTap: (){addDroppointCmpny(context,widget.cmpny);}, text: "Add DropPoint"),
                                  ))],),
                          ),
                        ),
                        CmpnyDroppointTablehead(
                          width: MediaQuery.of(context).size.width-350,
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) ,bottomLeft:Radius.circular(10) ),color: Palette.bgl),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10,bottom: 8),
                            child: Column(
                              children:  point.map(buildItem).toList(),
                            ),
                          ),
                        )

                      ]
                    );
                  }
                }

                else if (snapshot.hasError) {
                  print(snapshot.stackTrace);
                  return Container();
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Palette.main),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 50,),
          Container(
            width: MediaQuery.of(context).size.width-300,
            child: StreamBuilder<List<Type>>(
              stream: readType(cmpny.id) ,
              builder: (context, snapshot) {
                print(snapshot.error);
                if (snapshot.connectionState != ConnectionState.waiting && snapshot.hasData) {
                  List <Type> type = snapshot.data!;
                  print(snapshot.error);
                  if (type == null || type.isEmpty) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20,right: 0,bottom: 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width-350,

                            child: Row(children: [Expanded(child: Container()),Container(
                                height:45,
                                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight:Radius.circular(10) ,topLeft:Radius.circular(10) ),color: Palette.main),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                                  child: ButtonBold(onTap: (){addDroppointCmpny(context,widget.cmpny);}, text: "Add DropPoint"),
                                ))],),
                          ),
                        ),
                        CmpnyTypeHead(  width: MediaQuery.of(context).size.width,),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10,bottom: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 350,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "No Type added",
                                          style: GoogleFonts.signikaNegative(
                                              fontSize: 23.0, color: Palette.textd),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20,right: 0,bottom: 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width-350,

                            child: Row(children: [Expanded(child: Container()),Container(
                                height:45,
                                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight:Radius.circular(10) ,topLeft:Radius.circular(10) ),color: Palette.main),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                                  child: ButtonBold(onTap: (){ addTypeCmpny(context,widget.cmpny);}, text: "Add Type"),
                                ))],),
                          ),
                        ),
                        CmpnyTypeHead(  width: MediaQuery.of(context).size.width-350,),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) ,bottomLeft:Radius.circular(10) ),color: Palette.bgl),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10,bottom: 8),
                            child: Column(
                              children:  type.map(buildItemType).toList(),
                            ),
                          ),
                        )
                      ]

                    );
                  }
                }

                else if (snapshot.hasError) {
                  print(snapshot.stackTrace);
                  return Container();
                } else {
                  return Center(
                    child: Container(),
                  );
                }
              },
            ),
          ),
    SizedBox(height: 50,)
        ],
      ),
    );
  }

  Widget buildItem(Droppoint point) {
    return CmpnyDropPointRow(
      point: point,
      width: MediaQuery.of(context).size.width-350,
    );
  }
  Widget buildItemType(Type type) {
    return CmpnyTypeRow(type: type, width: MediaQuery.of(context).size.width-350);
  }
}
