import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/namesFile.dart';

class ImageAsset extends StatelessWidget {
  final String file;
  final double width;
  final dynamic  height ;

  ImageAsset({
    Key? key,
    this.file = NameFile.logo,
    this.width=250,
    this.height ,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Image.asset(
       file,
      width: width,
      height: height,
    );
  }
}
