


import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cross_file/cross_file.dart';


void navigate({required BuildContext context ,required String route, Object? arg,bool replacement=false})
{
  if(replacement==true)
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


void showToast({required String msg,required ToastStates toastStates,ToastGravity? gravity }) async
{
 await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity??ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getColor(toastStates),
      textColor: Colors.white,
      fontSize: 16.0.sp,
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
      return Colors.green;
    case ToastStates.error:
      return Colors.redAccent;
    case ToastStates.warning:
      return Colors.redAccent;
  }
}

buildScaffoldMessenger({required BuildContext context,required String msg,SnackBarBehavior? snackBarBehavior,Widget? iconWidget})
{

   return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
    content: Row(
      children: [
        iconWidget??SizedBox.shrink(),
         iconWidget!=null?SpaceWidget(width: 10,):SizedBox.shrink(),
        Text(
          msg,
          style: AppTextStyles.bold15(context).copyWith(color: AppColors.white),
        ),
      ],
    ),
    elevation: 0,
    backgroundColor: AppColors.primaryColor,
    behavior: snackBarBehavior?? SnackBarBehavior.fixed,
    duration: Duration(seconds: 5),
  ));

}

String formatDate({required DateTime dateTime,bool? monthName=false}) {
  int year = dateTime.year;
  int month = dateTime.month;
  int day = dateTime.day;
  if(monthName==true)
    {
      return '$day ${getMonthName(month)} $year';
    }
  else
    {
      return '$day/$month/$year';

    }
}

String getMonthName(int month)
{
  switch(month)
  {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    default:
      return 'December';
  }
}
String formatClock(DateTime dateTime)
{
  int hour = dateTime.hour;
  int minute = dateTime.minute;
  return '$hour:$minute';
}

getAmorPm(DateTime dateTime)
{
  int hour = dateTime.hour;
  if (hour > 12) {
    return 'PM';
  } else {
    return 'AM';
  }
}
getCurrentTime()
{
  if (DateTime.now().hour < 12) {
    return 'Good Morning';
  }
  else if (DateTime.now().hour < 17) {
    return 'Good Afternoon';
  }
  else
  {
    return 'Good Evening';
  }
}

 Future<XFile> getImageXFileByUrl(String url) async
 {
var file = await DefaultCacheManager().getSingleFile(url);
XFile result = await XFile(file.path);
return result;
}
