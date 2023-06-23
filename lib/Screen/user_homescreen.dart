import 'package:ewaste/Function/crud.dart';
import 'package:ewaste/Screen/user_adddevice.dart';
import 'package:ewaste/Screen/user_claims_screen.dart';
import 'package:ewaste/Screen/user_device_claim.dart';
import 'package:ewaste/Screen/user_pointScreen.dart';
import 'package:ewaste/Widget/Buttons.dart';
import 'package:ewaste/Widget/user_DeviceCrad.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/Cmpny.dart';
import '../Models/Droppoint.dart';
import '../Function/auth.dart';
import '../Function/color.dart';
import '../Models/DeviceType.dart';
import '../Models/Device.dart';
import '../Widget/FlotingContainer.dart';
class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

Type devicetype = Type();
Cmpny company =Cmpny();
Droppoint point =Droppoint();



class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // callopt();
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) =>Adddevice()));
      //
      // },child: Icon(Icons.add)),
      backgroundColor: Palette.bgd,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(child: Column(
                children: [
SizedBox(height: 10,),
                  Row(
                    children: [Expanded(child: Container()),ButtonText(onTap: (){
                      Authentication().signOut(context);
                    },text: "LogOut",),SizedBox(width: 20,)],
                  ),
                  SizedBox(height: 10,),

                  Row(children: [
                    Expanded(child: Container()),
                    RoundButton(text: 'Claim your Discount', onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>UserDeviceClaim()));
                    }, icon: Icon(Icons.request_page,color: Palette.textd,size: 20,),),
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
                      stream: readDevice(),
                      builder: (context, snapshot) {
                        print(snapshot.error);
                        if (snapshot.hasData) {
                          final device = snapshot.data;
                          if (device == null || device.isEmpty) {
                            return Center(
                              child: Container(

                                child: Center(child: Text("Sorry! No Device till now.",style: GoogleFonts.signikaNegative(
                                    fontSize: 30.0, color: Palette.textd))),),
                            );
                          } else {
                            return Center(
                              child: Wrap(
                                spacing: 20,
                                runSpacing: 20,
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
              child: FlotingContainer(text: "Add a Device",onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>Adddevice()));},),
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
