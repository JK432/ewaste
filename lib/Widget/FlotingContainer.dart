import 'package:ewaste/Function/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlotingContainer extends StatefulWidget {
  final String text;
  final void Function() onTap;
  const FlotingContainer({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  State<FlotingContainer> createState() => _FlotingContainerState();
}

class _FlotingContainerState extends State<FlotingContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height:60,
        decoration: BoxDecoration(
            color: Palette.main,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0,right: 18.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.signikaNegative(
                    fontSize: 40.0, color: Palette.textd,fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10,),
              Icon(
                Icons.add,
                color: Palette.textd,
                size: 50,
                weight: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
