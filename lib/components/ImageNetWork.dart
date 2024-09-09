import 'package:flutter/material.dart';

class ImageNetWork extends StatelessWidget {
  final String url;
  final dynamic width;
  final dynamic  height ;

  ImageNetWork({
    Key? key,
    this.url= "https://static.vecteezy.com/system/resources/thumbnails/012/986/755/small/abstract-circle-logo-icon-free-png.png",
    this.width=250,
    this.height,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Image.network(
      url,
      width: width,
      height: height,
    );
  }
}
