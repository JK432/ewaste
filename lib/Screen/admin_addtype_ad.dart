

import 'package:ewaste/Function/color.dart';
import 'package:ewaste/Function/crud.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/DeviceType.dart';
import '../Function/alert.dart';
class Addtype extends StatefulWidget {
  const Addtype({Key? key}) : super(key: key);

  @override
  State<Addtype> createState() => _AddtypeState();
}
GlobalKey<FormState> typeformkey = GlobalKey();
String typename = "";
int Lifeexpectancy = 0 ;
class _AddtypeState extends State<Addtype> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgd,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(child: Form(
            key: typeformkey,
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
                      hintText: "Type:",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter the Device Type';
                      } else {
                        typename = input;
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
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
                      hintText: "Life Expected",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Enter Life Expected';
                      } else {
                        Lifeexpectancy = int.parse(input);
                      }
                      return null;
                    }),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    TextButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text("Home")),
                    SizedBox(width: 20,),
                    ElevatedButton(onPressed: () async {
                      if (typeformkey.currentState!.validate()) {
                          await addType(typename, "",context);
                      }
                    }, child: Text("Add"))

                  ],

                ),
                SizedBox(height: 40,),
                StreamBuilder(
                    stream:readType("") ,
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

  Widget buildItem(Type type) {
    return Row(
      mainAxisSize:MainAxisSize.min,
      children: [Text(type.type,style: TextStyle(color: Palette.textd),),SizedBox(width: 10,),Text(type.cmpnyid,style: TextStyle(color: Palette.textd)),
      SizedBox(width: 5,),IconButton(onPressed: (){deletetype(type.id, context);}, icon:Icon(Icons.delete_forever),), SizedBox(width: 5,),IconButton(onPressed: (){}, icon:Icon(Icons.update),)
      ],);
  }
}