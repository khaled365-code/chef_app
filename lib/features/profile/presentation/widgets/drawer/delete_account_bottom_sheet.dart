
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/database/api/api_keys.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/widgets/shared_button.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/injection/injector.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../cubits/delete_account_cubit/delete_account_cubit.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => DeleteAccountCubit(
    profileRepoImplementation: locator.get<ProfileRepoImplementation>()
  ),
  child: BlocListener<DeleteAccountCubit, DeleteAccountState>(
  listener: (context, state)
  {
    handleDeleteAccountListener(state, context);
  },
  child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Container(
            width: 34.24.w,
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
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              )
          ),
          child: Column(
            children: [
              SizedBox(
                width: 130.w,
                  height: 100.h,
                  child: Image.asset(ImageConstants.trashSuitableGif)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('Are you sure you want to delete your account ?',style: AppTextStyles.bold18(context).copyWith(color: AppColors.c32343E,),),
              ),
              SpaceWidget(height: 5,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('Please be aware that once you delete your account, you will permanently lose\nall data within the app.',style: AppTextStyles.regular15(context).copyWith(color: AppColors.cA4ACAD,),),
              ),
              Spacer(),
              BlocBuilder<DeleteAccountCubit,DeleteAccountState>(
                builder: (context, state)
                {
                  if (state is DeleteMyAccountLoadingState)
                    {
                      return Center(
                        child: SharedLoadingIndicator(),
                      );
                    }
                  else
                    {
                      return SharedButton(
                        customHeight: 50,
                        btnTextStyle: AppTextStyles.bold19(context).copyWith(
                          color: AppColors.white,
                        ),
                        onPressed: ()
                        {
                          DeleteAccountCubit.get(context).deleteMyAccountFun(chefId: CacheHelper().getData(key: ApiKeys.id));
                        },
                        btnText: 'Delete Account',);
                    }
                },
              ),
              Spacer(),



            ]
             )
        ),
      ],
    ),
));
  }

  void handleDeleteAccountListener(DeleteAccountState state, BuildContext context) async
  {
    if(state is DeleteMyAccountSuccessState)
      {
         await CacheHelper().clearData();
        navigate(context: context, route: Routes.loginScreen,replacement: true);
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
  }
}
