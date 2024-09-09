
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartService extends StatelessWidget {
  final String title;
  final bool swicth ;
  void Function (bool)? onChanged  ;



  SmartService({
    required this.title, required this.swicth,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Icon(
              Icons.car_repair_outlined,
              size: 80,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value:swicth ,
                    onChanged:onChanged
                    ,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
