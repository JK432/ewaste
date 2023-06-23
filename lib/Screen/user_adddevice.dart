import 'dart:io';
import 'dart:typed_data';
import 'package:ewaste/Widget/Buttons.dart';

import '../Models/Cmpny.dart';
import '../Models/Droppoint.dart';
import 'package:ewaste/Function/auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ewaste/Function/crud.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/DeviceType.dart';
import '../Function/color.dart';
import '../Widget/textfieldform.dart';

class Adddevice extends StatefulWidget {
  const Adddevice({Key? key}) : super(key: key);

  @override
  State<Adddevice> createState() => _AdddeviceState();
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

class _AdddeviceState extends State<Adddevice> {
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
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: addDevFormkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Autocomplete<Cmpny>(
                            optionsMaxHeight: 400,
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              return cmpnylist
                                  .where((Cmpny cmpny) => cmpny.name
                                      .toLowerCase()
                                      .startsWith(textEditingValue.text
                                          .toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption: (Cmpny option) =>
                                option.name,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController
                                    fieldTextEditingController,
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
                                textEditingController:
                                    fieldTextEditingController,
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
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0),
                                    child: Material(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          height: options.length * 50,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width,
                                          constraints: new BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          color: Palette.bgd,
                                          child: ListView.builder(
                                            padding: EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            itemCount: options.length,
                                            itemBuilder:
                                                (BuildContext context,
                                                    int index) {
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
                          SizedBox(
                            height: 20,
                          ),
                          Autocomplete<Type>(
                            optionsMaxHeight: 400,
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              return option
                                  .where((Type t) => t.type
                                      .toLowerCase()
                                      .startsWith(textEditingValue.text
                                          .toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption: (Type option) =>
                                option.type,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController
                                    fieldTextEditingController,
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
                                textEditingController:
                                    fieldTextEditingController,
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
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0),
                                    child: Material(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          height: options.length * 50,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width,
                                          constraints: new BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          color: Palette.bgd,
                                          child: ListView.builder(
                                            padding: EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            itemCount: options.length,
                                            itemBuilder:
                                                (BuildContext context,
                                                    int index) {
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
                          TextFormField(
                              keyboardType: TextInputType.number,
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 23,
                                  color: Palette.textd,
                                  height: 0.99),
                              cursorColor: Palette.main,
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textd),
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textd),
                                ),
                                contentPadding: const EdgeInsets.all(0),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.main),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.main),
                                ),
                                errorStyle: GoogleFonts.signikaNegative(
                                    fontSize: 15,
                                    color: Palette.main,
                                    height: 0.99),
                                focusColor: Palette.main,
                                fillColor: Palette.main,
                                hintText: "Quantity in numbers",
                                hintStyle: GoogleFonts.signikaNegative(
                                    fontSize: 23,
                                    color: Palette.textd,
                                    height: 0.99),
                              ),
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return 'Enter the Quantity';
                                } else {
                                  qnty = int.parse(input);
                                }
                                return null;
                              }),
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
                          DropdownButtonFormField<String>(
                            dropdownColor: Palette.bgd,
                            value: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                            validator: (input) {
                              if (_selectedOption == null ||
                                  _selectedOption.length == 0) {
                                return 'Select an option';
                              } else {
                                hmode = _selectedOption;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Handovering Mode:',
                              labelStyle: GoogleFonts.signikaNegative(
                                  fontSize: 23,
                                  color: Palette.textd,
                                  height: 0.99),
                            ),
                            items: _options.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.signikaNegative(
                                      fontSize: 23,
                                      color: Palette.textd,
                                      height: 0.99),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _selectedOption == "Door service"
                              ? Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      child: TextFormField(
                                          textAlignVertical:
                                              TextAlignVertical.top,
                                          minLines: null,
                                          expands: true,
                                          maxLines: null,
                                          style:
                                              GoogleFonts.signikaNegative(
                                                  fontSize: 23,
                                                  color: Palette.textd,
                                                  height: 0.99),
                                          cursorColor: Palette.main,
                                          decoration: InputDecoration(
                                            // enabledBorder: const UnderlineInputBorder(
                                            //   borderSide: BorderSide(color: Palette.textd),
                                            // ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textd,
                                                  width: 2.0),
                                            ),
                                            border:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 2.0),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.main,
                                                  width: 2.0),
                                            ),
                                            errorBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.failed,
                                                  width: 2.0),
                                            ),
                                            errorStyle:
                                                GoogleFonts.signikaNegative(
                                                    fontSize: 15,
                                                    color: Palette.main,
                                                    height: 0.99),
                                            focusColor: Palette.main,
                                            fillColor: Palette.main,
                                            hintText: "Adress:",

                                            hintStyle:
                                                GoogleFonts.signikaNegative(
                                                    fontSize: 23,
                                                    color: Palette.textd,
                                                    height: 0.99),
                                          ),
                                          validator: (input) {
                                            if (input == null ||
                                                input.isEmpty) {
                                              return 'Enter the adress';
                                            } else {
                                              adress = input;
                                            }
                                            return null;
                                          }),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        keyboardType: TextInputType.number,
                                        style: GoogleFonts.signikaNegative(
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
                                          hintText: "Phone number",
                                          hintStyle:
                                              GoogleFonts.signikaNegative(
                                                  fontSize: 23,
                                                  color: Palette.textd,
                                                  height: 0.99),
                                        ),
                                        validator: (input) {
                                          if (input == null ||
                                              input.isEmpty ||
                                              input.length != 10) {
                                            return 'Enter the phone number';
                                          } else {
                                            pno = input;
                                          }
                                          return null;
                                        }),
                                  ],
                                )
                              : Column(children: [
                                  Autocomplete<Droppoint>(
                                    optionsMaxHeight: 400,
                                    optionsBuilder: (TextEditingValue
                                        textEditingValue) {
                                      return pointlist
                                          .where((Droppoint dp) => dp.adress
                                              .toLowerCase()
                                              .startsWith(textEditingValue
                                                  .text
                                                  .toLowerCase()))
                                          .toList();
                                    },
                                    displayStringForOption:
                                        (Droppoint dp) => dp.adress,
                                    fieldViewBuilder: (BuildContext context,
                                        TextEditingController
                                            fieldTextEditingController,
                                        FocusNode fieldFocusNode,
                                        VoidCallback onFieldSubmitted) {
                                      return TextFormField(
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
                                            hintText: "Point adress",
                                            hintStyle:
                                                GoogleFonts.signikaNegative(
                                                    fontSize: 23,
                                                    color: Palette.textd,
                                                    height: 0.99),
                                          ),
                                          controller:
                                              fieldTextEditingController,
                                          focusNode: fieldFocusNode,
                                          validator: (input) {
                                            if (input == null ||
                                                input.isEmpty ||
                                                pointid == "") {
                                              return 'Select address';
                                            } else {}
                                            return null;
                                          });
                                    },
                                    onSelected: (Droppoint selection) {
                                      pointid = selection.id;
                                    },
                                    optionsViewBuilder: (BuildContext
                                            context,
                                        AutocompleteOnSelected<Droppoint>
                                            onSelected,
                                        Iterable<Droppoint> options) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right:80.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, right: 8.0),
                                            child: Material(
                                              child: SingleChildScrollView(
                                                child: Container(
                                                  height: options.length * 50,
                                                  width:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                  constraints:
                                                      new BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                  ),
                                                  color:
                                                      Palette.bgd2,
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 10.0),
                                                    itemCount: options.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      final Droppoint option =
                                                          options.elementAt(
                                                              index);

                                                      return GestureDetector(
                                                        onTap: () {
                                                          onSelected(option);
                                                        },
                                                        child: ListTile(
                                                          title: Text(option.adress,
                                                              style: GoogleFonts
                                                                  .signikaNegative(
                                                                  fontSize: 23,
                                                                  color: Palette
                                                                      .textd,
                                                                  height:
                                                                  0.99))
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
                                ]),
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
                                  onTap: () async {
                                    if (addDevFormkey.currentState!
                                        .validate()) {
                                      if (filemissing == false &&
                                          file != null) {
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
                                          address: adress,
                                          cmpnyid: cmnpyid,
                                          droppointid: pointid,
                                          filelink: filelink,
                                          mode: hmode,
                                          qnty: qnty,
                                          typeid: typeid,
                                          userid: Authentication()
                                              .userData()
                                              .uid,
                                          context: context);
                                      print("Sucess");
                                    }
                                  },
                                  text: "Add"),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          // ElevatedButton(onPressed: () async {
                          //   if (addDevFormkey.currentState!.validate()) {
                          //       if(filemissing==false && file!=null){
                          //        filelink =  await uploaddoc(file!,DateTime.now().millisecondsSinceEpoch.toString(),context);
                          //       }
                          //       addDevice(status:"waiting" ,point:0 ,phno:pno ,address:adress ,cmpnyid:cmnpyid ,droppointid:pointid ,filelink: filelink ,mode: hmode,qnty: qnty,typeid:typeid ,userid:Authentication().userData().uid ,context: context);
                          //     print("Sucess");
                          //   };
                          //
                          // }, child: Text("Add"))
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
