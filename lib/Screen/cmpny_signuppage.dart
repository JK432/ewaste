import 'package:ewaste/Function/auth.dart';
import 'package:ewaste/Function/color.dart';
import 'package:ewaste/Widget/textfieldform.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widget/Buttons.dart';

class CmpnySignUpPage extends StatefulWidget {
  const CmpnySignUpPage({Key? key}) : super(key: key);

  @override
  State<CmpnySignUpPage> createState() => _CmpnySignUpPageState();
}

class _CmpnySignUpPageState extends State<CmpnySignUpPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> CompanyForm = GlobalKey();
    String Cname = "";
    String CEmail = "";
    String Weblink = "";
    String PPolicy = "";
    String imgurl = "";
    String password = "";
    bool bactive =true;

    return Scaffold(
      backgroundColor: Palette.bgd,

      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            Text(
                              "Be a Partner",
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 75,
                                  color: Palette.main,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height:50,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*2/3,
                          child: Column(
                            children: [
                              Container(
                                width:
                                MediaQuery.of(context).size.width *
                                    1.5 /
                                    3,
                                decoration: BoxDecoration(color: Palette.bgl,borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Form(
                                    key: CompanyForm,
                                      child: Column(
                                    children: [
                                      TextFieldForm(
                                          validatefunction: (input) {
                                            if (input == null || input.isEmpty) {
                                              return 'Please enter the Name';
                                            } else {
                                              Cname = input;
                                            }
                                            return null;
                                          },
                                          hintText: "Name"),
                                      SizedBox(height: 10,),
                                      TextFieldForm(
                                          validatefunction: (input) {
                                            if (input == null ||
                                                input.isEmpty ) {
                                              return 'Please enter the Website link';
                                            } else {
                                              Weblink = input;
                                            }
                                            return null;
                                          },
                                          hintText: "Website"),
                                      SizedBox(height: 10,),
                                      TextFieldForm(
                                          validatefunction: (input) {
                                            if (input == null || input.isEmpty) {
                                              return 'Please enter the Privacy Policy link';
                                            } else {
                                              PPolicy = input;
                                            }
                                            return null;
                                          },
                                          hintText: "Privacy Policy"),
                                      SizedBox(height: 10,),
                                      TextFieldForm(
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
                                          validatefunction: (input) {
                                            if (input == null ||
                                                input.isEmpty ||
                                                input.contains("@") == false) {
                                              return 'Please enter the Email';
                                            } else {
                                              CEmail = input;
                                            }
                                            return null;
                                          },
                                          hintText: "Email"),
                                      SizedBox(height: 10,),
                                      TextFieldForm(
                                          validatefunction: (input) {
                                            if (input == null || input.isEmpty || input.length<5 ) {
                                              return 'Please enter a valid the Password';
                                            } else {
                                              password = input;
                                            }
                                            return null;
                                          },
                                          hintText: "Password",
                                          obscuretext: true),
                                      SizedBox(height: 20,),
                                      Row(
                                        children: [
                                          Expanded(child: Container()),
                                          ButtonText(text: "Back", onTap: (){ Navigator.of(context).pop();}),
                                          SizedBox(width: 10,),
                                          bactive?ButtonBold(onTap: () async {
                                            if (CompanyForm.currentState!.validate()) {
                                              bactive = false;
                                              setState(() {});
                                              Authentication().SignUpCompany(email: CEmail, name: Cname, password: password, website: Weblink, ppolicy: PPolicy, context: context, imgurl: imgurl);
                                              bactive =true;
                                              setState(() {
                                              });

                                             // Navigator.of(context).pop();
                                              // await Authentication().signIn(email, password, context);

                                            }
                                          }, text: "Register"):CircularProgressIndicator(),
                                          SizedBox(width: 20,),

                                        ],

                                      ),

                                    ],
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://i.ibb.co/m9Z8dgR/bg.jpg"),fit: BoxFit.cover)) ,

                    height: MediaQuery.of(context).size.height,
                    child: Container(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
