import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedbot/utils/MyColor.dart';

class TextSimple extends StatelessWidget {
  final String text;

  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final GestureTapCallback? onTap;
  final Color color  ;
  final double fontSize;
  final bool bold;

  const TextSimple({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.onTap,

    this.fontSize = 15,
    this.bold = false,
    required this.color,
    
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontWeight: bold? FontWeight.bold:FontWeight.normal,
          fontSize: fontSize,
          color: color?? Colors.black,



        ),
        softWrap: softWrap,
        overflow: overflow,
      ),
    );
  }
}