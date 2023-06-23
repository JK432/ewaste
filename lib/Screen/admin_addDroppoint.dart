

import 'package:ewaste/Function/color.dart';
import 'package:ewaste/Function/crud.dart';
import '../Models/Droppoint.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Function/alert.dart';
class AddDroppoint extends StatefulWidget {
  const AddDroppoint({Key? key}) : super(key: key);

  @override
  State<AddDroppoint> createState() => _AddDroppointState();
}
GlobalKey<FormState> DroppointForm = GlobalKey();
String adress  = "";
String lat = "" ;
String lon = "" ;
class _AddDroppointState extends State<AddDroppoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgd,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(child: Form(
            key: DroppointForm ,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
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
                      hintText: "Adress",
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
                    keyboardType: TextInputType.url,
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
                        lat = input;
                      }
                      return null;
                    }),
                const SizedBox(height: 20,),
                TextFormField(
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
                        return 'Please enter the longitude';
                      } else {
                        lon = input;
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text("Home")),
                    SizedBox(width: 20,),
                    ElevatedButton(onPressed: () async {
                      if (DroppointForm.currentState!.validate()) {
                        await addPoint(adress, lat, lon,"", context);
                        // await addCmpny(Cmpnyname,Url,context);
                      }
                    }, child: Text("Add Droppoint"))

                  ],

                ),
                SizedBox(height: 40,),
                StreamBuilder(
                    stream:readDreoppoint() ,
                    builder: (context, snapshot) {
                      if(snapshot.hasError){
                        return Text("Error");
                        //TODO: ERoor wid
                      }
                      else if(snapshot.data==null){
                        return Text("no date");
                        //TODO: no widget
                      }else if(snapshot.data!=null||snapshot.hasData){
                        return Wrap(
                          spacing: 20,
                          children:snapshot.data!.map(buildItem).toList() ,
                        );
                        //TODO: no widget
                      }
                      return Container();
                    })

              ],
            ),
          ),),
        ),
      ),
    );
  }

  Widget buildItem(Droppoint dp) {
    return Row(
      mainAxisSize:MainAxisSize.min,
      children: [
        Text(dp.adress,style: TextStyle(color: Palette.textd),),
        SizedBox(width: 10,),
        Text(dp.lat,style: TextStyle(color: Palette.textd),),
        SizedBox(width: 10,),
        Text(dp.lon,style: TextStyle(color: Palette.textd),),
        SizedBox(width: 5,),
        IconButton(onPressed: (){openMap(dp.lat, dp.lon,context);}, icon:Icon(Icons.open_with),),
        SizedBox(width: 5,),
        IconButton(onPressed: (){deleteDroppoint(dp.id, context);}, icon:Icon(Icons.delete_forever),),
        SizedBox(width: 5,),
        IconButton(onPressed: (){
           dropupdatealert(context,dp);
          }, icon:Icon(Icons.update),)
      ],);
  }
}