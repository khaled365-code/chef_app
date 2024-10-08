

import 'package:chef_app/core/utilis/services/internet_connection_service.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../../core/widgets/name_and_text_field_widget.dart';
import '../widgets/forget_pass_change/confirm_pass_field.dart';
import '../widgets/forget_pass_change/new_password_field.dart';
import '../widgets/forget_pass_change/otp_code_container.dart';

class ForgetPassChangeScreen extends StatelessWidget {
  const ForgetPassChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String emailText=ModalRoute.of(context)!.settings.arguments as String;
    return BlocListener<ForgetPassCubit, ForgetPassState>(
  listener: (context, state)
  {
    handleChangePassListener(state, context);
  },
  child: Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              AuthHeaderWidget(
                  title: 'Verification',
                  subTitle: 'We have sent a code to your email\n$emailText',
                 hasBackButton: true,
                incomingContext: context,
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height*(520/812),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.r),
                      topLeft: Radius.circular(25.r),
                    ),
                ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                    child: BlocBuilder<ForgetPassCubit, ForgetPassState>(
                    builder: (context, state) {
                   return Form(
                      autovalidateMode: ForgetPassCubit.get(context).verifyCodeAutoValidateMode,
                      key: ForgetPassCubit.get(context).verifyCodeFormKey,
                      child: Column(
                        children:
                        [
                          SpaceWidget(height: 24,),
                          NewPasswordField(),
                          SpaceWidget(height: 24,),
                          ConfirmPassField(),
                          SpaceWidget(height: 24.h,),
                          NameAndTextFieldWidget(
                              title: 'Code',
                              childWidget: Row(
                                children: List.generate(
                                    6,
                                    (index) => Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.only(end:  index!=5? 10.w:0),
                                        child: OtpCodeContainer(
                                          singleContainerController: getCodeController(index: index,forgetPassCubit: ForgetPassCubit.get(context)),
                                        ),
                                      ),
                                    ),),
                              )),
                          SpaceWidget(height: 30,),
                          state is ForgetPassChangeWithCodeLoadingState ?
                          Center(
                            child: SharedLoadingIndicator(),):
                          SharedButton(
                            btnText: 'Verify',
                            onPressed: ()
                            {
                              verifyCodeActionButton(context, emailText);
                            },
                          ),
                        ],
                      ),
                    );
  },
),
                  ),
                                )

          )]),

    )),
);
  }
  void handleChangePassListener(ForgetPassState state, BuildContext context) {
    if(state is ForgetPassChangeWithCodeFailureState)
    {
      if(state.errorModel.error!=null)
      {
        buildScaffoldMessenger(context: context, msg: state.errorModel.error!.toString()
            .substring(
            1,state.errorModel.error!.toString().length-1));
      }
      else
      {
        buildScaffoldMessenger(context: context, msg: state.errorModel.errorMessage!);
      }
    }
    if(state is ForgetPassChangeWithCodeSuccessState)
    {
      buildScaffoldMessenger(context: context, msg: state.message);
      navigate(context: context, route: Routes.loginScreen);
    }
  }



  void verifyCodeActionButton(BuildContext context, String emailText) async {

    if(await InternetConnectionCheckingService.checkInternetConnection()==true)
      {
        if(ForgetPassCubit.get(context).verifyCodeFormKey.currentState!.validate())
        {
          ForgetPassCubit.get(context).verifyCodeFormKey.currentState!.save();
          ForgetPassCubit.get(context).forgetPassChangeWithCodeFun(
              email: emailText,
              code: getCompleteEmail(forgetPassCubit: ForgetPassCubit.get(context)),
              password: ForgetPassCubit.get(context).newPasswordController.text,
              confirmPassword: ForgetPassCubit.get(context).confirmNewPasswordController.text);
        }
        else
        {
          ForgetPassCubit.get(context).activateVerifyCodeAutoValidateMode();
        }
      }
    else
      {
        buildScaffoldMessenger(context: context, msg: 'You are offline',iconWidget: Icon(Icons.wifi_off,color: AppColors.white,));
      }

  }

  TextEditingController getCodeController({required int index,required ForgetPassCubit forgetPassCubit})
  {
    switch (index)
    {
      case 0:
        return forgetPassCubit.firstCodeController;
      case 1:
        return forgetPassCubit.secondCodeController;
      case 2:
        return forgetPassCubit.thirdCodeController;
      case 3:
        return forgetPassCubit.fourthCodeController;
      case 4:
        return forgetPassCubit.fifthCodeController;
      case 5:
        return forgetPassCubit.sixthCodeController;
      default:
        return forgetPassCubit.firstCodeController;
    }
  }
  String getCompleteEmail({required ForgetPassCubit forgetPassCubit})
  {
    return forgetPassCubit.firstCodeController.text+
        forgetPassCubit.secondCodeController.text+
        forgetPassCubit.thirdCodeController.text+
        forgetPassCubit.fourthCodeController.text+
        forgetPassCubit.fifthCodeController.text+
        forgetPassCubit.sixthCodeController.text;
  }
}


