


import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {

  final String text;
  final Color? textcolor;
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final TextStyle textStyle;
  final Color buttonColor;
  final void Function()? onPressed;
  final BoxBorder? border;

  const SharedButton({required this.text, this.textcolor, this.onPressed, required this.width, required this.height, this.borderRadius, required this.textStyle, required this.buttonColor, this.border});
  @override

  Widget build(BuildContext context) {

  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
    borderRadius: borderRadius,
    border: border,
    color: buttonColor,),
    child:MaterialButton(onPressed: onPressed,
      child: Center(child: Text(text,style:textStyle.copyWith(color: textcolor),)),
    ),
  );

  }
}
