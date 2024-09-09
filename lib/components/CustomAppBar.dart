import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedbot/utils/MyColor.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final  bool? etat;

   CustomAppBar({
    super.key,
    required this.title,
    this.etat = true ,

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColor.c1,


      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: MyColor.white,
        onPressed: () {
          Navigator.pop(context);


        },
      ),
      shadowColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(title,style:GoogleFonts.montserrat(fontSize: 32,fontWeight: FontWeight.bold),),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}