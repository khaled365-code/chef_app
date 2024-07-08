



import 'package:chef_app/core/utilis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../generated/l10n.dart';
import '../utilis/app_assets.dart';
import '../utilis/app_colors.dart';

class CustomImagePickerAvatar extends StatelessWidget {
  const CustomImagePickerAvatar({
    super.key,this.imageRadius=40, this.plusPaddingRightValue=10, this.plusPaddingBottomValue=0, this.plusIconRadius=10, this.cameraOnTap, this.galleryOnTap, this.image=imageConstants.user, this.icon=imageConstants.plus, this.plusPaddingTopValue=0, this.circleAvatarColor=AppColors.blue,
  });

  final double? imageRadius;
  final double? plusPaddingRightValue;
  final double? plusPaddingBottomValue;
  final double? plusIconRadius;
  final VoidCallback? cameraOnTap;
  final VoidCallback? galleryOnTap;
  final String? image;
  final String? icon;
  final double? plusPaddingTopValue;
  final Color? circleAvatarColor;






  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image!),
          radius: imageRadius,
        ),
        Padding(
          padding:  EdgeInsets.only(
            right: plusPaddingRightValue!,
            bottom: plusPaddingBottomValue!,
            top: plusPaddingTopValue!
          ),
          child: Container(
            child: GestureDetector(
              onTap: ()
              {
                showDialog(context: context, builder: (context) {
                  return Dialog(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.camera_alt,size: 35,),
                          title: Text(S.of(context).camera,style: AppTextStyles.font24.copyWith(color: AppColors.grey),),
                          onTap: cameraOnTap

                        ),
                        ListTile(
                          leading: Icon(Icons.photo,size: 35,),
                          title: Text(S.of(context).gallery,style: AppTextStyles.font24.copyWith(color: AppColors.grey),),
                          onTap: galleryOnTap

                        ),
                      ],
                    )
                  );
                },);
              },
              child: CircleAvatar(
                  backgroundImage: AssetImage(
                     icon!),
                  radius: plusIconRadius,
                  backgroundColor:
                  circleAvatarColor),
            ),
          ),
        ),
      ],
    );
  }
}

/*


*/
