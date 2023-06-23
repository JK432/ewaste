import 'package:ewaste/Function/auth.dart';

import 'package:ewaste/Widget/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Function/color.dart';
import '../Function/crud.dart';
import '../Models/Cmpny.dart';
import '../Models/Device.dart';
import '../Widget/cmpny_device_claim_head.dart';
import '../Widget/cmpny_device_claim_row.dart';
import '../Widget/cmpny_device_table_head.dart';
import '../Widget/cmpny_device_table_row.dart';
import 'cmpny_infopage.dart';
import 'cmpny_setings.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class CmpnyHomepage extends StatefulWidget {
  const CmpnyHomepage({Key? key}) : super(key: key);

  @override
  State<CmpnyHomepage> createState() => _CmpnyHomepageState();
}

Cmpny cmpny = Cmpny();
user U = Authentication().userData();

class _CmpnyHomepageState extends State<CmpnyHomepage> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();

  callopt() async {
    cmpny = await readOnecmpny(U.uid);
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    callopt();
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    return Scaffold(
      backgroundColor: Palette.bgd,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(title: Row(
            children: [
              Expanded(
                child: Padding(padding: const EdgeInsets.only(left: 8.0,right:8.0,top: 15,bottom: 25 ),
                    child: Text(cmpny.name,
                        style: GoogleFonts.signikaNegative(
                            fontSize: 23.0, color: Palette.textd)),
                  ),
              ),
            ],
          ),
            controller: sideMenu,
            style: SideMenuStyle(
                // showTooltip: false,
                displayMode: SideMenuDisplayMode.auto,
                hoverColor: Palette.bgd2,
                selectedColor: Colors.lightBlue,
                selectedTitleTextStyle: GoogleFonts.signikaNegative(
                    fontSize: 23.0,
                    color: Palette.main,
                    fontWeight: FontWeight.bold),
                backgroundColor: Palette.bgl,
                selectedIconColor: Palette.main,
                unselectedTitleTextStyle: GoogleFonts.signikaNegative(
                    fontSize: 23.0, color: Palette.textd),
                unselectedIconColor: Palette.textd

                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                // ),
                // backgroundColor: Colors.blueGrey[700]
                ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.dashboard),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Applied',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.app_registration),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Claims',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.request_page),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Items',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.info_outline),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Info',
                icon: Icon(Icons.account_circle),
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Container(
                        width: MediaQuery.of(context).size.width - 300,
                        child: StreamBuilder<List<Device>>(
                          stream: readDeviceforCmpny(cmpny.id),
                          builder: (context, snapshot) {
                            print(snapshot.error);
                            if (snapshot.connectionState != ConnectionState.waiting &&
                                snapshot.hasData) {
                              List<Device> device = snapshot.data!;
                              print(snapshot.error);
                              if (device == null || device.isEmpty) {
                                return Column(
                                  children: <Widget>[
                                    CmpnyDeviceHead(
                                      width: MediaQuery.of(context).size.width - 350,
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
                                                  "No device applied",
                                                  style: GoogleFonts.signikaNegative(
                                                      fontSize: 23.0,
                                                      color: Palette.textd),
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
                                        CmpnyDeviceHead(
                                          width:
                                              MediaQuery.of(context).size.width - 350,
                                        ),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) ,bottomLeft:Radius.circular(10) ),color: Palette.bgl),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10,bottom: 8),
                                        child: Column(
                                          children: device.map(buildItem1).toList(),
                                        ),
                                      ),
                                    )


                                      ]

                                );
                              }
                            } else if (snapshot.hasError) {
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
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Container(
                        width: MediaQuery.of(context).size.width - 300,
                        child: StreamBuilder<List<Device>>(
                          stream: readDeviceforCmpnyClaim(cmpny.id),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState != ConnectionState.waiting &&
                                snapshot.hasData) {
                              List<Device> device = snapshot.data!;
                              print(snapshot.error);
                              if (device == null || device.isEmpty) {
                                return Column(
                                  children: <Widget>[
                                    CmpnyDeviceClaimHead(
                                      width: MediaQuery.of(context).size.width - 350,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          child: Center(
                                            child: Text(
                                              "No device applied",
                                              style: GoogleFonts.signikaNegative(
                                                  fontSize: 23.0,
                                                  color: Palette.main),
                                            ),
                                          ),
                                        ))
                                      ],
                                    )
                                  ],
                                );
                              } else {
                                return Column(
                                  children: <Widget>[
                                        CmpnyDeviceClaimHead(
                                            width: MediaQuery.of(context).size.width -
                                                350),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) ,bottomLeft:Radius.circular(10) ),color: Palette.bgl),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10,bottom: 8),
                                        child: Column(children:device.map(buildItem2).toList() ,),
                                      ),)
                                      ]
                                      ,
                                );
                              }
                            } else if (snapshot.hasError) {
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
                    ],
                  ),
                ),
                CmpnySettings(cmpny: cmpny,),
                CmpnyInfopage(cmpny: cmpny,),




                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Info',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),

              ],
            ),
          ),

          // Column(
          //   children: [
          //
          //     SizedBox(height: 10,),
          //     ButtonBold(
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => CmpnySettings(cmpny: cmpny,)));
          //         },
          //         text: "Drop Point Add"),
          //     SizedBox(height: 10,),
          //     ButtonBold(
          //         onTap: () {
          //           Authentication().signOut(context);
          //         },
          //         text: "Sign Out"),
          //
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget buildItem1(Device device) {
    return CmpnyDeviceRow(
      device: device,
      no: 1,
      width: MediaQuery.of(context).size.width - 350,
    );
  }

  Widget buildItem2(Device device) {
    return CmpnyDeviceClaimRow(
      device: device,
      no: 1,
      width: MediaQuery.of(context).size.width - 350,
    );
  }
}
