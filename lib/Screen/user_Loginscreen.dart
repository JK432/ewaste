import 'package:ewaste/Widget/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Function/auth.dart';
import '../Function/color.dart';
import 'cmpny_signuppage.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool signin = true;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey2 = GlobalKey();
    GlobalKey<FormState> formKey3 = GlobalKey();
    String email = "";
    String password = "";
    String repassword = "";

    Widget cancelButton = TextButton(
      child: Text(
        "Back to Home",
        style:
            GoogleFonts.signikaNegative(fontSize: 23.0, color: Palette.textd),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );


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
                        signin
                            ? Container(
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
                                          "SignIN",
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
                                      
                                      width:
                                          MediaQuery.of(context).size.width *
                                              1.5 /
                                              3,
                                      decoration: BoxDecoration(color: Palette.bgl,borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Form(
                                            key: formKey2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                    style: GoogleFonts
                                                        .signikaNegative(
                                                            fontSize: 23,
                                                            color:
                                                                Palette.textd,
                                                            height: 0.99),
                                                    cursorColor: Palette.main,
                                                    decoration:
                                                        InputDecoration(
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide(
                                                                color: Palette
                                                                    .textd),
                                                      ),
                                                      border:
                                                          const UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide(
                                                                color: Palette
                                                                    .textd),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .all(0),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide(
                                                                color: Palette
                                                                    .main),
                                                      ),
                                                      errorBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide(
                                                                color: Palette
                                                                    .main),
                                                      ),
                                                      errorStyle: GoogleFonts
                                                          .signikaNegative(
                                                              fontSize: 15,
                                                              color: Palette
                                                                  .main,
                                                              height: 0.99),
                                                      focusColor:
                                                          Palette.main,
                                                      fillColor: Palette.main,
                                                      hintText: "Email:",
                                                      hintStyle: GoogleFonts
                                                          .signikaNegative(
                                                              fontSize: 23,
                                                              color: Palette
                                                                  .textd,
                                                              height: 0.99),
                                                    ),
                                                    validator: (input) {
                                                      if (input == null ||
                                                          input.isEmpty) {
                                                        return 'Please enter the Email';
                                                      } else {
                                                        email = input;
                                                      }
                                                      return null;
                                                    }),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                TextFormField(
                                                    style: GoogleFonts
                                                        .signikaNegative(
                                                            fontSize: 23,
                                                            color:
                                                                Palette.textd,
                                                            height: 0.99),
                                                    obscureText: true,
                                                    cursorColor: Palette.main,
                                                    decoration:
                                                        InputDecoration(
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide(
                                                                color: Palette
                                                                    .textd),
                                                      ),
                                                      border:
                                                          const UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide(
                                                                color: Palette
                                                                    .textd),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .all(0),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide(
                                                                color: Palette
                                                                    .main),
                                                      ),
                                                      errorBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide(
                                                                color: Palette
                                                                    .main),
                                                      ),
                                                      errorStyle: GoogleFonts
                                                          .signikaNegative(
                                                              fontSize: 15,
                                                              color: Palette
                                                                  .main,
                                                              height: 0.99),
                                                      focusColor:
                                                          Palette.main,
                                                      fillColor: Palette.main,
                                                      hintText: "Password:",
                                                      hintStyle: GoogleFonts
                                                          .signikaNegative(
                                                              fontSize: 23,
                                                              color: Palette
                                                                  .textd,
                                                              height: 0.99),
                                                    ),
                                                    validator: (input) {
                                                      if (input == null ||
                                                          input.isEmpty) {
                                                        return 'Enter the Password';
                                                      } else {
                                                        password = input;
                                                      }
                                                      return null;
                                                    }),
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(child: Container()),
                                                    ButtonText(text: "Back to Home", onTap:  () {
                                                      Navigator.of(context).pop();
                                                    }),
                                                    const SizedBox(width: 10,),
                                                    ButtonBold(onTap: () async {
                                                      if (formKey2.currentState!.validate()) {
                                                        await Authentication().signIn(email, password, context);
                                                      }
                                                    }, text: "Sign In"),

                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),

                                              ],
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
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
                                        "SignUP",
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
                          width:
                          MediaQuery.of(context).size.width *
                                    1.5 /
                                    3,
                          decoration: BoxDecoration(color: Palette.bgl,borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Form(
                                            key: formKey3,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                    style:
                                                        GoogleFonts.signikaNegative(
                                                            fontSize: 23,
                                                            color: Palette.textd,
                                                            height: 0.99),
                                                    cursorColor: Palette.main,
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.textd),
                                                      ),
                                                      border:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.textd),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets.all(0),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.main),
                                                      ),
                                                      errorBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.main),
                                                      ),
                                                      errorStyle:
                                                          GoogleFonts.signikaNegative(
                                                              fontSize: 15,
                                                              color: Palette.main,
                                                              height: 0.99),
                                                      focusColor: Palette.main,
                                                      fillColor: Palette.main,
                                                      hintText: "Email:",
                                                      hintStyle:
                                                          GoogleFonts.signikaNegative(
                                                              fontSize: 23,
                                                              color: Palette.textd,
                                                              height: 0.99),
                                                    ),
                                                    validator: (input) {
                                                      if (input == null ||
                                                          input.isEmpty) {
                                                        return 'Please enter the Email';
                                                      } else {
                                                        email = input;
                                                      }
                                                      return null;
                                                    }),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                TextFormField(
                                                    style:
                                                        GoogleFonts.signikaNegative(
                                                            fontSize: 23,
                                                            color: Palette.textd,
                                                            height: 0.99),
                                                    obscureText: true,
                                                    cursorColor: Palette.main,
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.textd),
                                                      ),
                                                      border:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.textd),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets.all(0),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.main),
                                                      ),
                                                      errorBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.main),
                                                      ),
                                                      errorStyle:
                                                          GoogleFonts.signikaNegative(
                                                              fontSize: 15,
                                                              color: Palette.main,
                                                              height: 0.99),
                                                      focusColor: Palette.main,
                                                      fillColor: Palette.main,
                                                      hintText: "Password:",
                                                      hintStyle:
                                                          GoogleFonts.signikaNegative(
                                                              fontSize: 23,
                                                              color: Palette.textd,
                                                              height: 0.99),
                                                    ),
                                                    validator: (input) {
                                                      if (input == null ||
                                                          input.isEmpty) {
                                                        return 'Enter the Password';
                                                      } else {
                                                        password = input;
                                                      }
                                                      return null;
                                                    }),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                TextFormField(
                                                    style:
                                                        GoogleFonts.signikaNegative(
                                                            fontSize: 23,
                                                            color: Palette.textd,
                                                            height: 0.99),
                                                    obscureText: true,
                                                    cursorColor: Palette.main,
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.textd),
                                                      ),
                                                      border:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.textd),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets.all(0),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.main),
                                                      ),
                                                      errorBorder:
                                                          const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Palette.main),
                                                      ),
                                                      errorStyle:
                                                          GoogleFonts.signikaNegative(
                                                              fontSize: 15,
                                                              color: Palette.main,
                                                              height: 0.99),
                                                      focusColor: Palette.main,
                                                      fillColor: Palette.main,
                                                      hintText: "Reenter Password:",
                                                      hintStyle:
                                                          GoogleFonts.signikaNegative(
                                                              fontSize: 23,
                                                              color: Palette.textd,
                                                              height: 0.99),
                                                    ),
                                                    validator: (input) {
                                                      if (input == null ||
                                                          input.isEmpty ||
                                                          input != password) {
                                                        return 'ReEnter the Password';
                                                      } else {
                                                        repassword = input;
                                                      }
                                                      return null;
                                                    }),
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(child: Container()),
                                                    ButtonText(text: "Back to Home", onTap:  () {
                                                      Navigator.of(context).pop();
                                                    }),
                                                    const SizedBox(width: 10,),
                                                    ButtonBold(onTap: () {
                                                      if (formKey3.currentState!.validate()) {
                                                        Authentication().Createuser(
                                                            roll: "Nuser",
                                                            context: context,
                                                            email: email,
                                                            password: password);
                                                      }
                                                    }, text: "Sign Up"),

                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            const SizedBox(
                              width: 50,
                            ),
                            signin?Text(
                              "New Here then",
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 23,
                                  color: Palette.textd,
                                  ),
                            ):Text(
                              "Already a Hero",
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 23,
                                  color: Palette.textd,
                                  ),
                            ),
                            signin ? ButtonText(text:"Sign Up." , onTap: (){
                              setState(() {
                                signin = !signin;
                              });
                            }):ButtonText(text:"Sign In." , onTap: (){
                              setState(() {
                                signin = !signin;
                              });
                            }),Text(
                              " Be a Partner",
                              style: GoogleFonts.signikaNegative(
                                fontSize: 23,
                                color: Palette.textd,
                              ),
                            ),
                            ButtonText(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const CmpnySignUpPage()));
                                },
                                text: "Company Register"),
                            Expanded(child: Container()),
                          ],
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
