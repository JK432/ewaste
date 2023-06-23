import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Function/alert.dart';
import '../Function/color.dart';
import '../Function/crud.dart';
import '../Function/time.dart';
import '../Models/Device.dart';
import '../Models/MessageModel.dart';
import '../Widget/Buttons.dart';
import '../Widget/MessageCard.dart';

class UserDeviceScreen extends StatefulWidget {
  final Device device;
  const UserDeviceScreen({Key? key, required this.device}) : super(key: key);

  @override
  State<UserDeviceScreen> createState() => _UserDeviceScreenState();
}

class _UserDeviceScreenState extends State<UserDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgd,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height ,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.height-75,
                          width: MediaQuery.of(context).size.width -
                              (MediaQuery.of(context).size.width / 1.8),
                          child: SingleChildScrollView(
                            child: StreamBuilder(
                                stream: readonedevice(widget.device.id),
                                builder: (context, snapshot) {
                                  if (snapshot != null && snapshot.hasData) {
                                    Device device = snapshot.data!;
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 18,bottom: 18),
                                      child: Container(
                                        decoration: BoxDecoration(color: Palette.bgl,borderRadius: BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height:20,
                                              ),
                                              Row(
                                                children: [
                                                  Text("Device :" ,style: GoogleFonts.signikaNegative(
                                                      fontSize: 15,
                                                      color: Palette.textl)),
                                                  SizedBox(width: 10,),

                                                  FutureBuilder(
                                                      future: readOnedtype(device.typeid),
                                                      builder: (context, snapshot) {
                                                        if (snapshot != null &&
                                                            snapshot.hasData) {
                                                          return Text(
                                                            snapshot.data!.type,
                                                            style:
                                                            GoogleFonts.signikaNegative(
                                                                fontSize: 23,
                                                                color: Palette.textd,
                                                                height: 0.99),
                                                          );
                                                        } else {
                                                          return Container();
                                                        }
                                                      }),
                                                ],
                                              ),
                                              device.mode=="Claim"?SizedBox(height: 20,): Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Quantity :" ,style: GoogleFonts.signikaNegative(
                                                          fontSize: 15,
                                                          color: Palette.textl)),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        device.qnty.toString(),
                                                        style: GoogleFonts.signikaNegative(
                                                            fontSize: 23,
                                                            color: Palette.textd,
                                                            height: 0.99),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                              // SizedBox(
                                              //   height: 20,
                                              // ),
                                              // Row(
                                              //   children: [
                                              //     Text("Quantity :" ,style: GoogleFonts.signikaNegative(
                                              //         fontSize: 15,
                                              //         color: Palette.textl)),
                                              //     SizedBox(
                                              //       width: 10,
                                              //     ),
                                              //     Text(
                                              //       device.qnty.toString(),
                                              //       style: GoogleFonts.signikaNegative(
                                              //           fontSize: 23,
                                              //           color: Palette.textd,
                                              //           height: 0.99),
                                              //     ),
                                              //   ],
                                              // ),
                                              // SizedBox(
                                              //   height: 20,
                                              // ),
                                              device.filelink.length == 0
                                                  ? Row(
                                                children: [
                                                  Text("File Status :" ,style: GoogleFonts.signikaNegative(
                                                      fontSize: 15,
                                                      color: Palette.textl)),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "File not Attached",
                                                    style:
                                                    GoogleFonts.signikaNegative(
                                                        fontSize: 23.0,
                                                        color: Palette.alert),
                                                  ),
                                                ],
                                              )
                                                  : Row(
                                                children: [
                                                  Text("File Status :" ,style: GoogleFonts.signikaNegative(
                                                      fontSize: 15,
                                                      color: Palette.textl)),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "File Available",
                                                    style:
                                                    GoogleFonts.signikaNegative(
                                                        fontSize: 23.0,
                                                        color: Palette.textd),
                                                  ),
                                                ],
                                              ),
                                              device.mode=="Claim"?Container():Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),

                                                  Row(
                                                    children: [
                                                      Text("Transport Mode :" ,style: GoogleFonts.signikaNegative(
                                                          fontSize: 15,
                                                          color: Palette.textl)),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        device.mode,
                                                        style: GoogleFonts.signikaNegative(
                                                            fontSize: 23.0,
                                                            color: Palette.textd),
                                                      ),
                                                    ],
                                                  ),


                                                ],
                                              ),

                                              device.mode=="Claim"?SizedBox(height: 20,):
                                              device.mode == "Door service"
                                                  ? Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Address :" ,style: GoogleFonts.signikaNegative(
                                                          fontSize: 15,
                                                          color: Palette.textl)),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        device.address,
                                                        style: GoogleFonts
                                                            .signikaNegative(
                                                            fontSize: 23,
                                                            color: Palette.textd,
                                                            height: 0.99),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Row(
                                                    children: [
                                                      Text("Phone no :" ,style: GoogleFonts.signikaNegative(
                                                          fontSize: 15,
                                                          color: Palette.textl)),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        device.phno,
                                                        style: GoogleFonts
                                                            .signikaNegative(
                                                            fontSize: 23,
                                                            color: Palette.textd,
                                                            height: 0.99),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20,)
                                                ],
                                              )
                                                  : Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 20,),
                                                  Row(
                                                    children: [
                                                      Text("DropPoint :" ,style: GoogleFonts.signikaNegative(
                                                          fontSize: 15,
                                                          color: Palette.textl)),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      FutureBuilder(
                                                          future: readOnedroppoint(
                                                              device.droppointid),
                                                          builder: (context, snapshot) {
                                                            if (snapshot != null &&
                                                                snapshot.hasData) {
                                                              return Text(
                                                                snapshot.data!.adress,
                                                                style: GoogleFonts
                                                                    .signikaNegative(
                                                                    fontSize: 23,
                                                                    color: Palette.textd,
                                                                    height: 0.99),
                                                              );
                                                            } else {
                                                              return Container();
                                                            }
                                                          }),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  Text("Time Added :" ,style: GoogleFonts.signikaNegative(
                                                      fontSize: 15,
                                                      color: Palette.textl)),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    timefromepoch().millisecondsToDateTime(int.parse(device.id)),
                                                    style: GoogleFonts.signikaNegative(
                                                        fontSize: 23,
                                                        color: Palette.textd,
                                                        height: 0.99),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20,),
                                              Row(
                                                children: [
                                                  Text("Status :" ,style: GoogleFonts.signikaNegative(
                                                      fontSize: 15,
                                                      color: Palette.textl)),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    device.status,
                                                    style: GoogleFonts.signikaNegative(
                                                        fontSize: 23,
                                                        color: Palette.textd,
                                                        height: 0.99),
                                                  ),
                                                ],
                                              ),
                                              device.mode=="Claim"?SizedBox(
                                                height: 20,
                                              ):  Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Points :" ,style: GoogleFonts.signikaNegative(
                                                          fontSize: 15,
                                                          color: Palette.textl)),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "${device.point}",
                                                        style: GoogleFonts.signikaNegative(
                                                            fontSize: 23,
                                                            color: Palette.textd,
                                                            height: 0.99),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10,)
                                                ],
                                              ),
                                              // SizedBox(
                                              //   height: 20,
                                              // ),
                                              // Row(
                                              //   children: [
                                              //     Text("Points :" ,style: GoogleFonts.signikaNegative(
                                              //         fontSize: 15,
                                              //         color: Palette.textl)),
                                              //     SizedBox(
                                              //       width: 10,
                                              //     ),
                                              //     Text(
                                              //       "${device.point}",
                                              //       style: GoogleFonts.signikaNegative(
                                              //           fontSize: 23,
                                              //           color: Palette.textd,
                                              //           height: 0.99),
                                              //     ),
                                              //   ],
                                              // ),
                                              // SizedBox(height: 10,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                          child: Container(
                            height:75,
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width / 1.8) - 8 - 8,
                            decoration: BoxDecoration(color: Palette.bgl,borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                               // mainAxisSize: MainAxisSize.min,

                                children: [
                                  Expanded(child: Container()),
                                  ButtonText(text: "Cancel", onTap: (){
                                    Navigator.of(context).pop();
                                  }),

                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  // ButtonBold(
                                  //   onTap: () {
                                  //     addStatusAndMessage(
                                  //         context, widget.device, "Reviewing");
                                  //   },
                                  //   text: "Hold",
                                  // ),
                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  // ButtonBold(
                                  //   onTap: () {
                                  //     addStatusAndMessage(
                                  //         context, widget.device, "Rejected");
                                  //   },
                                  //   text: "Reject",
                                  // ),
                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  // ButtonBold(
                                  //   onTap: () {
                                  //     approveAndMessage(
                                  //         context, widget.device, "Approved");
                                  //   },
                                  //   text: "Approve",
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Palette.bgd2),
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: SingleChildScrollView(
                    child: StreamBuilder(
                        stream: readmessage(widget.device.id),
                        builder: (context, snapshot) {
                          print(snapshot.error);
                          if (snapshot != null && snapshot.hasData) {
                            final message = snapshot.data!;
                            if(message.isEmpty|| message.length==0)
                              return Padding(
                                padding: const EdgeInsets.only(top:18.0,left: 20.0,bottom: 20),
                                child: Text(
                                  "NO Messages",
                                  style: GoogleFonts.signikaNegative(
                                      fontSize: 23,
                                      color: Palette.textd,
                                      height: 0.99),
                                ),
                              );
                            else
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:18.0,left: 20.0,bottom: 20),
                                    child: Text(
                                      "Messages :",
                                      style: GoogleFonts.signikaNegative(
                                          fontSize: 23,
                                          color: Palette.textd,
                                          height: 0.99),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: message.map(buildItem).toList(),
                                  ),
                                ],
                              );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(top:18.0,left: 20.0,bottom: 20),
                              child: Text(
                                "NO Messages where sended",
                                style: GoogleFonts.signikaNegative(
                                    fontSize: 23,
                                    color: Palette.textd,
                                    height: 0.99),
                              ),
                            );
                          }
                        }),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(Msg message) {
    return MessageCard(message: message);
  }
}
