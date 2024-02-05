

import 'package:flutter/cupertino.dart';


class ReusedImage extends StatelessWidget {  @override

  final String path;
  final double? width;
  final double? height;
  final BoxFit?  boxFit;

  ReusedImage({required this.path, this.width, this.height,this.boxFit});
  Widget build(BuildContext context) {

   return Image.asset(
     path,
     width: width,
     height: height,
     fit: boxFit,
   );

  }
}
