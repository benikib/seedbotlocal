import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedbot/utils/MyColor.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double elevation;
  final EdgeInsets padding;
  final double borderRadius;

  Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = MyColor.c4,
    this.textColor = MyColor.white,
    this.elevation = 4.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [MyColor.c5, MyColor.c4],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          borderRadius: BorderRadius.circular(borderRadius),
        ),

        height: 60,

        margin: EdgeInsets.symmetric(horizontal: 0),child:  ElevatedButton(

      onPressed: onPressed,

      style: ElevatedButton.styleFrom(

        backgroundColor: Colors.transparent,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),


      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),)
    );
  }
}