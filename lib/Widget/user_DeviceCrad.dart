import 'package:ewaste/Function/crud.dart';
import 'package:ewaste/Function/time.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/Cmpny.dart';
import '../Models/Droppoint.dart';
import '../Function/color.dart';
import '../Models/DeviceType.dart';
import '../Models/Device.dart';
import '../Screen/user_device_individual.dart';

class DeviceCard extends StatefulWidget {
  final Device device;
  const DeviceCard({Key? key, required this.device}) : super(key: key);

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

Type devicetype = Type();
Cmpny company = Cmpny();
Droppoint point = Droppoint();

class _DeviceCardState extends State<DeviceCard> {
  @override
  callopt() async {
    devicetype = await readOnedtype(widget.device.typeid);
    company = await readOnecmpny(widget.device.cmpnyid);
    if (widget.device.droppointid != "") {
      point = await readOnedroppoint(widget.device.droppointid);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    callopt();
    super.initState();
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserDeviceScreen(
                      device: widget.device,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Palette.bgl,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 255,
        width: 250,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.laptop,
                    size: 25,
                    color: Palette.textl,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: readOnedtype(widget.device.typeid),
                        builder: (context, snapshot) {
                          if (snapshot != null && snapshot.hasData) {
                            return Text(
                              snapshot.data!.type,
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 28,
                                  color: Palette.textd,
                                  height: 0.99,
                                  fontWeight: FontWeight.w500),
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.business,
                    size: 25,
                    color: Palette.textl,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: readOnecmpny(widget.device.cmpnyid),
                        builder: (context, snapshot) {
                          if (snapshot != null && snapshot.hasData) {
                            return Text(
                              snapshot.data!.name,
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 20,
                                  color: Palette.textd,
                                  height: 0.99),
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ),
                ],
              ),

              widget.device.mode=="Claim"?const SizedBox(
                height: 15,
              ):widget.device.mode == "Door service"
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.door_back_door, size: 25,
                            color: Palette.textl,),SizedBox(width: 10,),
                          Text(
                              widget.device.address,
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 23, color: Palette.textd, height: 0.99),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Icon(Icons.place,size: 25,
                            color: Palette.textl,),
                          SizedBox(width: 10,),
                          FutureBuilder(
                              future: readOnedroppoint(widget.device.droppointid),
                              builder: (context, snapshot) {
                                if (snapshot != null && snapshot.hasData) {
                                  return Text(
                                    snapshot.data!.adress,
                                    style: GoogleFonts.signikaNegative(
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
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),

              Row(
                children: [
                  Expanded(child: Container(height: 1,)),
                  widget.device.status=="Approved"?Text(
                    widget.device.status,
                    style: GoogleFonts.signikaNegative(
                        fontSize: 30, color: Palette.sucess, height: 0.99,fontWeight: FontWeight.w600),
                  ):widget.device.status=="Rejected"?Text(
                    widget.device.status,
                    style: GoogleFonts.signikaNegative(
                        fontSize: 30, color: Palette.alert, height: 0.99,fontWeight: FontWeight.w600),
                  ):Text(
                    widget.device.status,
                    style: GoogleFonts.signikaNegative(
                        fontSize: 30, color: Palette.textd, height: 0.99,fontWeight: FontWeight.w600),
                  ),
                  Expanded(child: Container(height: 1,)),

                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(Icons.numbers,size: 25,
                    color: Palette.textl,),
                  SizedBox(width: 10,),
                  Text(
                    widget.device.qnty.toString(),
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                  ),
                  Expanded(child: Container()),


                ],
              ),
              SizedBox(height: 10,),
              Row(children: [ Icon(Icons.calendar_month,size: 25,
                color: Palette.textl,),
                SizedBox(width: 10,),
                Text(
                  timefromepoch().millisecondsToDateTimeasFormated(int.parse(widget.device.id)),
                  style: GoogleFonts.signikaNegative(
                      fontSize:20, color: Palette.textd, height: 0.99),
                )],)
            ],
          ),
        ),
      ),
    );
  }
}
