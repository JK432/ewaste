

import 'package:ewaste/Function/color.dart';
import 'package:ewaste/Function/crud.dart';
import '../Models/Cmpny.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Function/alert.dart';
class AddCmpny extends StatefulWidget {
  const AddCmpny({Key? key}) : super(key: key);

  @override
  State<AddCmpny> createState() => _AddCmpnyState();
}
GlobalKey<FormState> CmpyRegForm= GlobalKey();
String Cmpnyname = "";
String Url = "" ;
class _AddCmpnyState extends State<AddCmpny> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgd,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(child: Form(
            key: CmpyRegForm,
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
                      hintText: "Name",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter the Company name';
                      } else {
                        Cmpnyname = input;
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
                      hintText: "Web site Url",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Enter the URL';
                      } else {
                        Url = input;
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
                      if (CmpyRegForm.currentState!.validate()) {
                        await addCmpny(Cmpnyname,Url,context);
                      }
                    }, child: Text("Add Company"))

                  ],

                ),
                SizedBox(height: 40,),
                StreamBuilder(
                    stream:readCmpny() ,
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

  Widget buildItem(Cmpny cmpny) {
    return Row(
      mainAxisSize:MainAxisSize.min,
      children: [Text(cmpny.name,style: TextStyle(color: Palette.textd),),SizedBox(width: 10,),Text(cmpny.url.toString(),style: TextStyle(color: Palette.textd)),
        SizedBox(width: 5,),IconButton(onPressed: (){deleteCmpny(cmpny.id, context);}, icon:Icon(Icons.delete_forever),), SizedBox(width: 5,),IconButton(onPressed: (){cmpnyupdatealert(context,cmpny);}, icon:Icon(Icons.update),)
      ],);
  }
}