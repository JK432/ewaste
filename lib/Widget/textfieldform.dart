import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Function/color.dart';


class TextFieldForm extends StatefulWidget {
  bool expands ;
  bool enabled;
  bool obscuretext;
  final String? Function(String?) validatefunction;
  void Function(String?)? onchangefunction;
  TextEditingController? textEditingController;
  final String hintText;
  String? intial;
  TextFieldForm({
    this.expands=false,
    this.enabled =true,
    this.textEditingController,
   

    required this.validatefunction,
    required this.hintText,
    this.intial = null,
    this.obscuretext = false,
    this.onchangefunction,
    Key? key,
  }) : super(key: key);


  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

        // minLines: widget.length==0?null:widget.length,
        // maxLines: widget.length==0?null:widget.length+1,
        textAlignVertical: TextAlignVertical.top,

        enabled: widget.enabled,
        initialValue: widget.intial,
        controller: widget.textEditingController,
        onChanged: widget.onchangefunction,
        obscureText: widget.obscuretext,

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
          hintText: widget.hintText,
          hintStyle: GoogleFonts.signikaNegative(
              fontSize: 23, color: Palette.textd, height: 0.99),
        ),

        validator: widget.validatefunction

    );




  }
}




class TextFieldFormExpanded extends StatefulWidget {
  bool expands ;
  bool enabled;
  bool obscuretext;
  final String? Function(String?) validatefunction;
  void Function(String?)? onchangefunction;
  TextEditingController? textEditingController;
  final String hintText;
  String intial;
  TextFieldFormExpanded({
    this.expands=false,
    this.enabled =true,
    this.textEditingController,


    required this.validatefunction,
    required this.hintText,
    this.intial = "",
    this.obscuretext = false,
    this.onchangefunction,
    Key? key,
  }) : super(key: key);


  @override
  State<TextFieldFormExpanded> createState() => _TextFieldFormExpandedState();
}

class _TextFieldFormExpandedState extends State<TextFieldFormExpanded> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
minLines: null,
      maxLines: null,
      // minLines: widget.length==0?null:widget.length,
      // maxLines: widget.length==0?null:widget.length+1,
        textAlignVertical: TextAlignVertical.top,
        expands: widget.expands,
        enabled: widget.enabled,
        initialValue: widget.intial,
        controller: widget.textEditingController,
        onChanged: widget.onchangefunction,
        obscureText: widget.obscuretext,

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
          hintText: widget.hintText,
          hintStyle: GoogleFonts.signikaNegative(
              fontSize: 23, color: Palette.textd, height: 0.99),
        ),

        validator: widget.validatefunction

    );




  }
}


class SelectableTextFieldForm extends StatefulWidget {
  bool expands ;
  bool enabled;
  bool obscuretext;
  final String? Function(String?) validatefunction;
  void Function(String?)? onchangefunction;
  TextEditingController? textEditingController;
  final String hintText;
  String? intial;
  final FocusNode focusNode;
  SelectableTextFieldForm({
    this.expands=false,
    this.enabled =true,
    this.textEditingController,

    required this.focusNode,
    required this.validatefunction,
    required this.hintText,
    this.intial = null,
    this.obscuretext = false,
    this.onchangefunction,
    Key? key,
  }) : super(key: key);


  @override
  State<SelectableTextFieldForm> createState() => _SelectableTextFieldFormState();
}

class _SelectableTextFieldFormState extends State<SelectableTextFieldForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
          focusNode:widget.focusNode,

      // minLines: widget.length==0?null:widget.length,
      // maxLines: widget.length==0?null:widget.length+1,
        textAlignVertical: TextAlignVertical.top,

        enabled: widget.enabled,
        initialValue: widget.intial,
        controller: widget.textEditingController,
        onChanged: widget.onchangefunction,
        obscureText: widget.obscuretext,

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
          hintText: widget.hintText,
          hintStyle: GoogleFonts.signikaNegative(
              fontSize: 23, color: Palette.textd, height: 0.99),
        ),

        validator: widget.validatefunction

    );




  }
}

