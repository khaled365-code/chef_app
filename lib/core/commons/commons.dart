

import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

void navigate({required BuildContext context ,required String route, Object? arg,bool replacement=false})
{
  if(replacement=true)
    {
      Navigator.pushReplacementNamed(context,route,arguments: arg);
    }
  else
    {
      Navigator.pushNamed(context, route,arguments: arg);

    }
}
Future uploadImageToAPI(XFile image) async
{
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}


void showToast({required String msg,required ToastStates toastStates}) async
{
 await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getColor(toastStates),
      textColor: Colors.white,
      fontSize: 16.0.sp
  );

}

Future<XFile?> imagePick({required ImageSource imageSource}) async
{
  XFile? image =await ImagePicker().pickImage(source: imageSource);
  return image!=null? image : null;

}

enum ToastStates{success,error,warning}

Color getColor(ToastStates toastStates)
{
  switch (toastStates)
  {
    case ToastStates.success:
      return AppColors.primaryColor;
    case ToastStates.error:
      return AppColors.primaryColor;
    case ToastStates.warning:
      return AppColors.primaryColor;
  }
}

buildScaffoldMessenger({required BuildContext context,required String msg,SnackBarBehavior? snackBarBehavior})
{

   return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
    content: Text(
      msg,
      style: AppTextStyles.bold15(context).copyWith(color: AppColors.white),
    ),
    elevation: 0,
    backgroundColor: AppColors.primaryColor,
    behavior: snackBarBehavior?? SnackBarBehavior.fixed,
    duration: Duration(seconds: 5),
  ));

}

