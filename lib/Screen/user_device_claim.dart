import 'dart:io';
import 'dart:typed_data';
import '../Models/Cmpny.dart';
import '../Models/Droppoint.dart';
import 'package:ewaste/Function/auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ewaste/Function/crud.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/DeviceType.dart';
import '../Function/color.dart';
import '../Widget/Buttons.dart';
import '../Widget/textfieldform.dart';

class AddClaim extends StatefulWidget {
  const AddClaim({Key? key}) : super(key: key);

  @override
  State<AddClaim> createState() => _AddClaimState();
}

Uint8List? file;
List<Type> option = [];
List<Cmpny> cmpnylist = [];
List<Droppoint> pointlist = [];
String pno = "";
String hmode = "";
int qnty = 0;
String cmnpyid = "";
String pointid = "";
String typeid = "";
bool filemissing = true;
GlobalKey<FormState> addDevFormkey = GlobalKey();
String _selectedOption = "Door service"; // initially no option is selected
List<String> _options = ['Drop Point', 'Door service'];
String adress = "";
String filelink = "";

class _AddClaimState extends State<AddClaim> {
  callopt() async {
    cmpnylist = await readcmpny();
    option = await readtype(cmnpyid);

    pointlist = await readdroppoint(cmnpyid);
  }

  @override
  void initState() {
    // TODO: implement initState
    callopt();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgd,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Palette.bgd2,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: addDevFormkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Autocomplete<Cmpny>(
                            optionsMaxHeight: 400,
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              return cmpnylist
                                  .where((Cmpny cmpny) => cmpny.name
                                      .toLowerCase()
                                      .startsWith(
                                          textEditingValue.text.toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption: (Cmpny option) => option.name,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              return SelectableTextFieldForm(
                                focusNode: fieldFocusNode,
                                validatefunction: (input) {
                                  if (input == null ||
                                      input.isEmpty ||
                                      cmnpyid == "") {
                                    return 'Select a Manufature from a List';
                                  } else {}
                                  return null;
                                },
                                hintText: "Manufactures name",
                                textEditingController: fieldTextEditingController,
                              );
                            },
                            onSelected: (Cmpny selection) async {
                              cmnpyid = selection.id;
                              await callopt();
                              setState(() {});
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<Cmpny> onSelected,
                                Iterable<Cmpny> options) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 80.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 0, right: 0),
                                    child: Material(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          height: options.length * 50,
                                          width: MediaQuery.of(context).size.width,
                                          constraints: new BoxConstraints(
                                            maxWidth:
                                                MediaQuery.of(context).size.width,
                                          ),
                                          color: Palette.bgd,
                                          child: ListView.builder(
                                            padding: EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            itemCount: options.length,
                                            itemBuilder:
                                                (BuildContext context, int index) {
                                              final Cmpny option =
                                                  options.elementAt(index);

                                              return GestureDetector(
                                                onTap: () {
                                                  onSelected(option);
                                                },
                                                child: ListTile(
                                                  title: Text(option.name,
                                                      style: GoogleFonts
                                                          .signikaNegative(
                                                          fontSize: 23,
                                                          color: Palette
                                                              .textd,
                                                          height:
                                                          0.99)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 20),
                          Autocomplete<Type>(
                            optionsMaxHeight: 400,
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              return option
                                  .where((Type t) => t.type
                                      .toLowerCase()
                                      .startsWith(
                                          textEditingValue.text.toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption: (Type option) => option.type,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              return SelectableTextFieldForm(
                                hintText: "Choose the type",
                                validatefunction: (input) {
                                  if (input == null ||
                                      input.isEmpty ||
                                      typeid == "") {
                                    return 'Choose the device type';
                                  } else {}
                                  return null;
                                },
                                textEditingController: fieldTextEditingController,
                                focusNode: fieldFocusNode,
                              );
                            },
                            onSelected: (Type selection) {
                              typeid = selection.id;
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<Type> onSelected,
                                Iterable<Type> options) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 80.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 0, right: 0),
                                    child: Material(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          height: options.length * 50,
                                          width: MediaQuery.of(context).size.width,
                                          constraints: new BoxConstraints(
                                            maxWidth:
                                                MediaQuery.of(context).size.width,
                                          ),
                                          color: Palette.bgd2,
                                          child: ListView.builder(
                                            padding: EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            itemCount: options.length,
                                            itemBuilder:
                                                (BuildContext context, int index) {
                                              final Type option =
                                                  options.elementAt(index);

                                              return GestureDetector(
                                                onTap: () {
                                                  onSelected(option);
                                                },
                                                child: ListTile(
                                                  title: Text(option.type,
                                                      style: GoogleFonts
                                                          .signikaNegative(
                                                          fontSize: 23,
                                                          color: Palette
                                                              .textd,
                                                          height:
                                                          0.99)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['pdf'],
                                    allowMultiple: false,
                                  );
                                  if (result == null) {
                                    setState(() {
                                      filemissing = true;
                                    });
                                    //TODO: handle with some thing
                                  }
                                  if (result != null) {
                                    setState(() {
                                      filemissing = false;
                                    });
                                    file = result.files.first.bytes;
                                  }
                                },
                                child: Text("Pick a file",
                                    style: GoogleFonts.signikaNegative(
                                        fontSize: 18,
                                        color: Palette.textd,
                                        height: 0.99)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              filemissing
                                  ? Text(
                                      "No file selected if you select a file ...",
                                      style: GoogleFonts.signikaNegative(
                                          fontSize: 23,
                                          color: Palette.textd,
                                          height: 0.99),
                                    )
                                  : Container(),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFieldForm(
                              validatefunction: (input) {
                                if (input == null ||
                                    input.isEmpty ||
                                    input.length != 10) {
                                  return 'Enter the phone number';
                                } else {
                                  pno = input;
                                }
                                return null;
                              },
                              hintText: "Phone Number"),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              ButtonText(
                                  text: "Cancel",
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  }),
                              SizedBox(
                                width: 20,
                              ),
                              ButtonBold(
                                  onTap:  () async {
                                    if (addDevFormkey.currentState!.validate()) {
                                      if (filemissing == false && file != null) {
                                        filelink = await uploaddoc(
                                            file!,
                                            DateTime.now()
                                                .millisecondsSinceEpoch
                                                .toString(),
                                            context);
                                      }
                                      addDevice(
                                          status: "waiting",
                                          point: 0,
                                          phno: pno,
                                          address: "noadress",
                                          cmpnyid: cmnpyid,
                                          droppointid: "nodroppoint",
                                          filelink: filelink,
                                          mode: "Claim",
                                          qnty: 0,
                                          typeid: typeid,
                                          userid: Authentication().userData().uid,
                                          context: context);
                                      print("Sucess");
                                    }
                                    ;
                                  },
                                  text: "Add"),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          // ElevatedButton(
                          //     onPressed: () async {
                          //       if (addDevFormkey.currentState!.validate()) {
                          //         if (filemissing == false && file != null) {
                          //           filelink = await uploaddoc(
                          //               file!,
                          //               DateTime.now()
                          //                   .millisecondsSinceEpoch
                          //                   .toString(),
                          //               context);
                          //         }
                          //         addDevice(
                          //             status: "waiting",
                          //             point: 0,
                          //             phno: pno,
                          //             address: "noadress",
                          //             cmpnyid: cmnpyid,
                          //             droppointid: "nodroppoint",
                          //             filelink: filelink,
                          //             mode: "Claim",
                          //             qnty: 0,
                          //             typeid: typeid,
                          //             userid: Authentication().userData().uid,
                          //             context: context);
                          //         print("Sucess");
                          //       }
                          //       ;
                          //     },
                          //     child: Text("Add"))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
