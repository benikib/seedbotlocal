import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedbot/utils/MyColor.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? etat;

  Function()? function;

  // Ajout d'une hauteur personnalisée
  final double appBarHeight;

  CustomAppBar({
    super.key,
    required this.title,
    this.etat = true,
    this.appBarHeight = 80.0,  // Définir une hauteur par défaut plus grande
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColor.c1,
      actions: [],
      leading: etat == true
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        color: MyColor.white,
        onPressed: () {
          Navigator.pop(context);
        },
      )
          : Container(),
      shadowColor: Colors.transparent,
      elevation: 2,
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Ajout d'un padding pour bien centrer le titre si besoin
      toolbarHeight: appBarHeight, // Ajuste la hauteur de la barre ici
    );
  }

  // Utilisation de la hauteur personnalisée
  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
