import 'package:flutter/material.dart';
import 'package:seedbot/utils/MyColor.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final EdgeInsets padding;
  final double borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;
  final IconData? suffixIcon;
  final IconData prefixIcon;
  final Function()? suffixIconOnPressed;
   TextInput({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
      this.suffixIcon ,
     required this.prefixIcon,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    this.borderRadius = 8.0,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = MyColor.c4,
     this.suffixIconOnPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: hintText,
        contentPadding: padding,
        suffixIcon: suffixIcon == null ? IconButton(onPressed: suffixIconOnPressed, icon: Icon(suffixIcon,color: MyColor.c4)) : Icon(suffixIcon,color: MyColor.c4),
        prefixIcon:Icon(prefixIcon,color: MyColor.c4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor),

        ),
      ),
    );
  }
}