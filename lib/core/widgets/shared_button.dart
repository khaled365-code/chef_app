


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

  const SharedButton({required this.text, this.textcolor, this.onPressed, required this.width, required this.height, this.borderRadius, required this.textStyle, required this.buttonColor});
  @override

  Widget build(BuildContext context) {

  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
    borderRadius: borderRadius,
    color: buttonColor,),
    child:MaterialButton(onPressed: onPressed,
      child: Center(child: Text(text,style:textStyle.copyWith(color: textcolor),)),
    ),
  );

  }
}
