
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/injection/injector.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/delete_account_cubit/delete_account_cubit.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => DeleteAccountCubit(
    profileRepoImplementation: locator.get<ProfileRepoImplementation>()
  ),
  child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
  listener: (context, state)
  {
    if(state is DeleteMyAccountSuccessState)
      {
         CacheHelper().clearData();
         Future.delayed(Duration(milliseconds: 500));
        navigate(context: context, route: Routes.loginScreen);
      }
    if(state is DeleteMyAccountFailureState)
      {

        if(state.errorModel.error!=null)
        {
          showToast(msg: state.errorModel.error.toString().substring(1,state.errorModel.error.toString().length-1), toastStates: ToastStates.error);
        }
        else
        {
         showToast(msg: state.errorModel.errorMessage!, toastStates: ToastStates.error);
        }
      }
  },
  builder: (context, state) {
    var deleteAccountCubit = BlocProvider.of<DeleteAccountCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Container(
            width: 34.2.w,
            height: 35.h,
            decoration:BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: Center(
              child: SvgPicture.asset(ImageConstants.closeIcon),
            ),
          ),
        ),
        SpaceWidget(height: 10,),
        Container(
          height: MediaQuery.sizeOf(context).height*(316/812),
          width: MediaQuery.sizeOf(context).width,
          color: AppColors.white,
          child: Column(
            children: [
              SpaceWidget(height: 7,),
              Text('Delete Account',style: AppTextStyles.bold18(context).copyWith(color: AppColors.c181C2E),),
              SpaceWidget(height: 8,),
              SizedBox(
                width: 103.w,
                  height: 103.h,
                  child: Image.asset(ImageConstants.deleteAccountGif)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: FittedBox(child: Text('Are you sure you want to delete your account ?',style: AppTextStyles.bold18(context).copyWith(color: AppColors.c00243C,),)),
              ),
              SpaceWidget(height: 5,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text('Please be aware that once you delete your account, you will permanently lose\nall data within the app.',style: AppTextStyles.regular15(context).copyWith(color: AppColors.cA4ACAD,),),
              ),
              Spacer(),
              state is DeleteMyAccountLoadingState?
              Center(
                child: SizedBox(
                    width: 30.w,
                    height: 30.w,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                      strokeWidth: 2.w,

                    )),
              ):
              SharedButton(
                btnSize: WidgetStatePropertyAll(Size(327.w, 50.h)),
                btnTextStyle: AppTextStyles.bold17(context).copyWith(
                  fontSize: 19,
                  color: AppColors.white,
                ),
                  onPressed: ()
                {
                  deleteAccountCubit.deleteMyAccountFun(chefId: CacheHelper().getData(key: ApiKeys.id));
                },
                btnText: 'Delete Account',),
              SpaceWidget(height: 15,),


            ]
             )
        ),
      ],
    );
  },
),
);
  }
}
