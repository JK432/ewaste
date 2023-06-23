import 'package:ewaste/Models/Point.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Function/color.dart';
import '../Function/crud.dart';
class UserCmpnypointsCard extends StatefulWidget {
  final String cid;
  const UserCmpnypointsCard({Key? key,required this.cid}) : super(key: key);

  @override
  State<UserCmpnypointsCard> createState() => _UserCmpnypointsCardState();
}
int tot =0;
class _UserCmpnypointsCardState extends State<UserCmpnypointsCard> {
  // asyint()async{
  //   List<userPointitem> plist = await readpointlistDevice(widget.cid).first;
  //   plist.forEach((element) {tot = tot + element.point;});
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Palette.bgd2,borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
            future: readOnecmpny(widget.cid),
            builder: (context, snapshot) {
              if (snapshot != null && snapshot.hasData) {
                final cmpny =snapshot.data;
                return Container(
                  child: Row(
                    children: [
                      Container(height: 200,width: 200,

                        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(cmpny!.imgurl),fit: BoxFit.cover),color: Palette.main,borderRadius: BorderRadius.circular(10)) ),
                    SizedBox(width: 20,),
                        Container(
                          height: 190,
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.business_sharp,color: Palette.textd,size: 23,),SizedBox(width: 5,),
                              Text(
                                snapshot.data!.name,
                                style: GoogleFonts.signikaNegative(
                                    fontSize: 23, color: Palette.textd, height: 0.99),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Icon(Icons.offline_bolt,color: Palette.textd,size: 23,),SizedBox(width: 5,),
                              FutureBuilder(
                                  future: readpointlistDevice(widget.cid).first,
                                  builder: (context, snapshot) {
                                    if (snapshot != null && snapshot.hasData) {
                                      final pointlist =snapshot.data;
                                      tot = 0;
                                      pointlist!.forEach((element) {tot= tot+element.point;});

                                      return Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              "${tot}",
                                              style: GoogleFonts.signikaNegative(
                                                  fontSize: 35, color: Palette.blue, height: 0.99,fontWeight: FontWeight.bold),
                                            )

                                          ],),);
                                    } else {
                                      return Container();
                                    }
                                  }),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Icon(Icons.mail_rounded,color: Palette.textd,size: 23,),SizedBox(width: 5,),
                              SizedBox(width: 10,),
                              Text(
                                snapshot.data!.email,
                                style: GoogleFonts.signikaNegative(
                                    fontSize: 23, color: Palette.textd, height: 0.99),
                              ),
                              // FutureBuilder(
                              //     future: readpointlistDevice(widget.cid).first,
                              //     builder: (context, snapshot) {
                              //       if (snapshot != null && snapshot.hasData) {
                              //         final pointlist =snapshot.data;
                              //         tot = 0;
                              //         pointlist!.forEach((element) {tot= tot+element.point;});
                              //
                              //         return Container(
                              //           child: Column(
                              //             children: [
                              //               Text(
                              //                 "${tot}",
                              //                 style: GoogleFonts.signikaNegative(
                              //                     fontSize: 35, color: Palette.blue, height: 0.99,fontWeight: FontWeight.bold),
                              //               )
                              //
                              //             ],),);
                              //       } else {
                              //         return Container();
                              //       }
                              //     }),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Icon(Icons.cloud,color: Palette.textd,size: 23,),SizedBox(width: 5,),
                              SizedBox(width: 10,),
                              InkWell(
                                onTap: ()async{

                                  final link = Uri.parse(snapshot.data!.url);
                                  if (!await launchUrl(link)) {
                                    throw Exception('Could not launch $link');
                                  }

                                },
                                child: Text(
                                  "Website",
                                  style: GoogleFonts.signikaNegative(
                                      fontSize: 23, color: Palette.textd, height: 0.99),
                                ),
                              ),
                              // FutureBuilder(
                              //     future: readpointlistDevice(widget.cid).first,
                              //     builder: (context, snapshot) {
                              //       if (snapshot != null && snapshot.hasData) {
                              //         final pointlist =snapshot.data;
                              //         tot = 0;
                              //         pointlist!.forEach((element) {tot= tot+element.point;});
                              //
                              //         return Container(
                              //           child: Column(
                              //             children: [
                              //               Text(
                              //                 "${tot}",
                              //                 style: GoogleFonts.signikaNegative(
                              //                     fontSize: 35, color: Palette.blue, height: 0.99,fontWeight: FontWeight.bold),
                              //               )
                              //
                              //             ],),);
                              //       } else {
                              //         return Container();
                              //       }
                              //     }),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Icon(Icons.policy,color: Palette.textd,size: 23,),SizedBox(width: 5,),
                              SizedBox(width: 10,),
                              InkWell(
                                onTap: ()async{

                                  final link = Uri.parse(snapshot.data!.privacypolicy);
                                  if (!await launchUrl(link)) {
                                  throw Exception('Could not launch $link');
                                  }

                                },
                                child: Text(
                                  "Privacy Policy",
                                  style: GoogleFonts.signikaNegative(
                                      fontSize: 23, color: Palette.textd, height: 0.99),
                                ),
                              ),
                              // FutureBuilder(
                              //     future: readpointlistDevice(widget.cid).first,
                              //     builder: (context, snapshot) {
                              //       if (snapshot != null && snapshot.hasData) {
                              //         final pointlist =snapshot.data;
                              //         tot = 0;
                              //         pointlist!.forEach((element) {tot= tot+element.point;});
                              //
                              //         return Container(
                              //           child: Column(
                              //             children: [
                              //               Text(
                              //                 "${tot}",
                              //                 style: GoogleFonts.signikaNegative(
                              //                     fontSize: 35, color: Palette.blue, height: 0.99,fontWeight: FontWeight.bold),
                              //               )
                              //
                              //             ],),);
                              //       } else {
                              //         return Container();
                              //       }
                              //     }),
                            ],
                          ),


                        ],
                      ),)  ],),);
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );

  }
}
//Container(child: Row(children: [Container(height: 50,width: 50,child: Image.network(),)   ],),);

