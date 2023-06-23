
import 'package:ewaste/Function/color.dart';
import 'package:ewaste/Function/crud.dart';
import 'package:ewaste/Widget/Buttons.dart';
import 'package:ewaste/Widget/textfieldform.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/Device.dart';
import '../Models/DeviceType.dart';
import '../Models/Cmpny.dart';
import '../Models/Droppoint.dart';

///Checkint type function
bool isNumeric(String str) {
  try{
    var value = int.parse(str);
  } on FormatException {
    return false;
  } finally {
    return true;
  }
}

///Update type of a companu product
upadeTypeAlert(BuildContext context,Type type) {
  GlobalKey<FormState> typeupdateform = GlobalKey();
  String typename = "";

  Widget cancelButton = ButtonText(text: 'Cancel', onTap: (){    Navigator.of(context).pop();});
  Widget continueButton = ButtonBold(onTap: (){
    if (typeupdateform.currentState!.validate()) {
      updatetype(type.id, typename, type.cmpnyid, context);
      Navigator.of(context).pop();
    }

  }, text: 'Update');
  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Update Type",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(child: Form(
      key: typeupdateform,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldForm(validatefunction: (input) {
            if (input == null || input.isEmpty) {
              return 'Please enter the Device Type';
            } else {
              typename = input;
            }
            return null;
          } , hintText: 'Type'),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ),),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
///Add status and messge for the device
addStatusAndMessage(BuildContext context,Device device,String status) {
  GlobalKey<FormState> msgform = GlobalKey();
  String message = "";
  bool vis =true;
  Widget cancelButton = ButtonText(text: 'Cancel', onTap: (){    Navigator.of(context).pop();});
  Widget continueButton = ButtonBold(onTap: ()async{
    if (msgform.currentState!.validate()) {

      vis=false;
      await updatestatus(device,status,context,message);
      Navigator.of(context).pop();
      vis =true;
    }
  }, text: 'Change');
  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Change to "+ status,style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Form(
      key: msgform,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            // height: MediaQuery.of(context).size.height/1.5,
            // width: MediaQuery.of(context).size.width/1.5,
            child: Container(
              child: TextFieldFormExpanded(
                 enabled: true,
                  expands: true,
                  validatefunction: (input) {
                if (input == null || input.isEmpty) {
                  return 'Please enter the message';
                } else {
                  message = input;
                }
                return null;
              } , hintText: 'Message'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ),),
    actions: [
      cancelButton,
      vis?continueButton:CircularProgressIndicator(),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
///Approve Device alert
approveAndMessage(BuildContext context,Device device,String status) {
  GlobalKey<FormState> msgform = GlobalKey();
  String message = "";
  int point= 0;
  Widget cancelButton = ButtonText(text: 'Cancel', onTap: (){ Navigator.of(context).pop();});
  Widget continueButton = ButtonBold(onTap: ()async{
    if (msgform.currentState!.validate()) {
     await updatestatus(device,status,context,message);
     await addUserCompanyPoint(device,device.cmpnyid, device.id,context,point);
     //await addpoint(device,point,context);
      Navigator.of(context).pop();
    }

  }, text: 'Approve');
  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Change to "+ status,style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: msgform,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldForm(
                validatefunction: (input) {
                  if (input == null || input.isEmpty || !(isNumeric(input))) {
                    return 'Please enter the point';
                  } else {
                    point = int.parse(input);
                  }
                  return null;
                } , hintText: 'Point'),
            SizedBox(height: 20,),
            Expanded(
              // height: MediaQuery.of(context).size.height/1.5,
              // width: MediaQuery.of(context).size.width/1.5,
              child: Container(
                child: TextFieldFormExpanded(
                    enabled: true,
                    expands: true,
                    validatefunction: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter the message';
                      } else {
                        message = input;
                      }
                      return null;
                    } , hintText: 'Message'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



///
cmpnyupdatealert(BuildContext context,Cmpny cmpny) {

  GlobalKey<FormState> cmpnyupformkey = GlobalKey();
  String name = "";
  String url = "";
  String policy="";
  String imgurl ="";
  String email ="";


  Widget cancelButton = ButtonText(text: "Cancel", onTap: () {
    Navigator.of(context).pop();
  },);

  Widget continueButton = ButtonBold(onTap: () async {
    if (cmpnyupformkey .currentState!.validate()) {
     await updatecmpny(cmpny.id,name, url,policy,imgurl, email,  context);
      // updatecmpny(cmpny.id, name, url, context);
      Navigator.of(context).pop();
    }
  }, text: "Update")
  ;

  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Update Company",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(child: Form(
        key: cmpnyupformkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            TextFieldForm(
              intial: cmpny.name,
                validatefunction: (input) {
                  if (input == null || input.isEmpty) {
                    return 'Please enter the Name';
                  } else {
                    name = input;
                  }
                  return null;
                },
                hintText: "Name"),
            SizedBox(height: 10,),
            TextFieldForm(
                intial: cmpny.url,
                validatefunction: (input) {
                  if (input == null ||
                      input.isEmpty ) {
                    return 'Please enter the Website link';
                  } else {
                    url = input;
                  }
                  return null;
                },
                hintText: "Website"),
            SizedBox(height: 10,),
            TextFieldForm(
              intial: cmpny.privacypolicy,
                validatefunction: (input) {
                  if (input == null || input.isEmpty) {
                    return 'Please enter the Privacy Policy link';
                  } else {
                    policy = input;
                  }
                  return null;
                },
                hintText: "Privacy Policy"),
            SizedBox(height: 10,),
            TextFieldForm(
              intial: cmpny.imgurl,
                validatefunction: (input) {
                  if (input == null || input.isEmpty) {
                    return 'Please enter the Logo Link';
                  } else {
                    imgurl = input;
                  }
                  return null;
                },
                hintText: "Image Url"),
            SizedBox(height: 10,),
            TextFieldForm(
              intial: cmpny.email,
                validatefunction: (input) {
                  if (input == null ||
                      input.isEmpty ||
                      input.contains("@") == false) {
                    return 'Please enter the Email';
                  } else {
                    email = input;
                  }
                  return null;
                },
                hintText: "Email"),




          ],
        )),),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


dropupdatealert(BuildContext context,Droppoint dp) {
  GlobalKey<FormState> dpupformkey = GlobalKey();
  String adress = "";
  String lat = "";
  String lon = "";

  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {
      if (dpupformkey.currentState!.validate()) {
        updatedroppoint(dp.id,adress, lat,lon, context);
        Navigator.of(context).pop();
      }
    },
    child:const Text("Update") ,) ;

  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Update Company",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(child: Form(
      key: dpupformkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
              initialValue: dp.adress,
              style: GoogleFonts.signikaNegative(
                  fontSize: 23, color: Palette.textd, height: 0.99),
              cursorColor: Palette.main,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.textd),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.textd),
                ),
                contentPadding: const EdgeInsets.all(0),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.main),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.main),
                ),
                errorStyle: GoogleFonts.signikaNegative(
                    fontSize: 15, color: Palette.main, height: 0.99),
                focusColor: Palette.main,
                fillColor: Palette.main,
                hintText: "Adress:",
                hintStyle: GoogleFonts.signikaNegative(
                    fontSize: 23, color: Palette.textd, height: 0.99),
              ),
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return 'Please enter the Adress';
                } else {
                  adress = input;
                }
                return null;
              }),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
              initialValue: dp.lat,
              keyboardType: TextInputType.number,
              style: GoogleFonts.signikaNegative(
                  fontSize: 23, color: Palette.textd, height: 0.99),

              cursorColor: Palette.main,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.textd),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.textd),
                ),
                contentPadding: const EdgeInsets.all(0),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.main),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.main),
                ),
                errorStyle: GoogleFonts.signikaNegative(
                    fontSize: 15, color: Palette.main, height: 0.99),
                focusColor: Palette.main,
                fillColor: Palette.main,
                hintText: "Latitude",
                hintStyle: GoogleFonts.signikaNegative(
                    fontSize: 23, color: Palette.textd, height: 0.99),
              ),
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return 'Enter the Latitude';
                } else {
                  lat= input;
                }
                return null;
              }),
          const SizedBox(height: 20,),
          TextFormField(
              initialValue: dp.lon,
              keyboardType: TextInputType.number,
              style: GoogleFonts.signikaNegative(
                  fontSize: 23, color: Palette.textd, height: 0.99),

              cursorColor: Palette.main,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.textd),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.textd),
                ),
                contentPadding: const EdgeInsets.all(0),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.main),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.main),
                ),
                errorStyle: GoogleFonts.signikaNegative(
                    fontSize: 15, color: Palette.main, height: 0.99),
                focusColor: Palette.main,
                fillColor: Palette.main,
                hintText: "Longitude",
                hintStyle: GoogleFonts.signikaNegative(
                    fontSize: 23, color: Palette.textd, height: 0.99),
              ),
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return 'Enter the Longitude';
                } else {
                  lon= input;
                }
                return null;
              }),
          const SizedBox(height: 20,),


        ],
      ),
    ),),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

///Cmpny add droppoint
addDroppointCmpny(BuildContext context,Cmpny cmpny) {
  GlobalKey<FormState> dropform = GlobalKey();
  String address  = "";
  String lat = "" ;
  String lon = "" ;


  Widget cancelButton = ButtonText(text: "Cancel", onTap: (){Navigator.of(context).pop();});
  Widget continueButton = ButtonBold(onTap: () async {
    if (dropform.currentState!.validate()) {
      await addPoint(address, lat, lon,cmpny.id, context);
      Navigator.of(context).pop();
    }
  }, text: 'Add');

  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Add Droppoint",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(child: Form(
      key: dropform,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         TextFieldForm(validatefunction:

           (input) {
             if (input == null || input.isEmpty) {
               return 'Please enter the Address Type';
             } else {
               address = input;
             }
             return null;
           }
         , hintText: "Address"),

          const SizedBox(
            height: 20,
          ),
          TextFieldForm(validatefunction:

              (input) {
            if (input == null || input.isEmpty) {
              return 'Please enter the latitude';
            } else {
              lat = input;
            }
            return null;
          }
              , hintText: "Latitude"),
          const SizedBox(height: 20,),
          TextFieldForm(validatefunction:

              (input) {
            if (input == null || input.isEmpty) {
              return 'Please enter the longitude';
            } else {
              lon = input;
            }
            return null;
          }
              , hintText: "Longitude"),


        ],
      ),
    ),),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

///Cmpny add type
addTypeCmpny(BuildContext context,Cmpny cmpny) {
  GlobalKey<FormState> typeform = GlobalKey();
  String type  = "";



  Widget cancelButton = ButtonText(text: "Cancel", onTap: (){Navigator.of(context).pop();});
  Widget continueButton = ButtonBold(onTap: () async {
    if (typeform.currentState!.validate()) {
      await addType(type,cmpny.id,context);
      Navigator.of(context).pop();
    }
  }, text: 'Add');

  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Add Type",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(child: Form(
      key: typeform,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldForm(validatefunction:

              (input) {
            if (input == null || input.isEmpty) {
              return 'Please enter the Type';
            } else {
              type = input;
            }
            return null;
          }
              , hintText: "Type"),

          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ),),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
