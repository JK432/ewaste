import 'package:ewaste/Screen/user_adddevice.dart';
import 'package:ewaste/Screen/user_device_claim.dart';
import 'package:ewaste/Screen/user_pointScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Function/auth.dart';
import '../Function/color.dart';
import '../Function/crud.dart';
import '../Models/Device.dart';
import '../Widget/Buttons.dart';
import '../Widget/FlotingContainer.dart';
import '../Widget/user_DeviceCrad.dart';
class UserDeviceClaim extends StatefulWidget {
  const UserDeviceClaim({Key? key}) : super(key: key);

  @override
  State<UserDeviceClaim> createState() => _UserDeviceClaimState();
}

class _UserDeviceClaimState extends State<UserDeviceClaim> {
  @override

    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Palette.bgd,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(child: Column(
                children: [
                  // Text("Normal User"),
                SizedBox(height: 40,),
                  Row(children: [
                    Expanded(child: Container()),
                    RoundButton(text: 'Add a Device', onTap: () {
                      Navigator.pop(context);
                    }, icon: Icon(Icons.devices,color: Palette.textd,size: 20,),),
                    SizedBox(width: 20,),
                    RoundButton(text: 'Your Points', onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>UserPointScreen()));
                    }, icon: Icon(Icons.offline_bolt,color: Palette.textd,size: 20,),),
                    SizedBox(width: 15,),
                  ],),

                  SizedBox(height: 40,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<List<Device>>(
                      stream: readClaimDevice(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final device = snapshot.data;
                          if (device == null || device.isEmpty) {
                            return Center(
                              child: Container(

                                child: Center(child: Text("Sorry! No docs till now.",style: GoogleFonts.signikaNegative(
                                    fontSize: 30.0, color: Palette.textd))),),
                            );
                          } else {
                            return Center(
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: device.map(buildItem).toList(),
                                )
                            );
                          }
                        }

                        if (snapshot.hasError) {
                          print(snapshot.stackTrace);
                          return Container();
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(color: Palette.main),
                          );
                        }
                      },
                    ),
                  )

                ],
              ),),
            ),

            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height-60,right: 8),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FlotingContainer(text: "Add a Claim",onTap: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>AddClaim()));

                  },),
              ),
            ),
          ],
        ),
      );
    }


    Widget buildItem(Device device) {
      return DeviceCard(device:device );
    }
  }

