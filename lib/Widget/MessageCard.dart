import 'package:ewaste/Function/time.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Function/color.dart';
import '../Models/MessageModel.dart';
class MessageCard extends StatefulWidget {
  final Msg message;
  const MessageCard({Key? key, required this.message}) : super(key: key);

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:5,bottom: 10,right: 20,left: 20),
      child: Container(
        decoration: BoxDecoration(color: Palette.bgl,borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  timefromepoch().millisecondsToDateTime(int.parse(widget.message.id)),
                  style: GoogleFonts.signikaNegative(
                      fontSize: 15.0, color: Palette.textl),
                ),
              ],
            ),
            Text(
              widget.message.msg,
              style: GoogleFonts.signikaNegative(
                  fontSize: 23.0, color: Palette.textd),
            ),
          ],),
        ),
      ),
    );
  }
}
