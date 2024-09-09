import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/namesFile.dart';

class IconImage extends StatelessWidget {
  final String file;
  final double width;
  final double  height ;
  final GestureTapCallback? onTap;
  Color? color ;


  IconImage({
    Key? key,
    this.file = NameFile.logo,
    this.width=50,
    this.height =50 ,
    this.onTap,
    this.color,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Image.asset(
        file,
        width: width,
        height: height,
        color: color,
        fit: BoxFit.contain,

      ),
    );
  }
}
