

import 'package:chef_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

import '../utilis/app_text_styles.dart';

class NameAndTextFieldWidget extends StatelessWidget {
  const NameAndTextFieldWidget({super.key, required this.title, required this.childWidget});

  final String title;
  final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTextStyles.regular13(context).copyWith(color: Color(0xff32343E)),),
        SpaceWidget(height: 8,),
        childWidget
      ],
    );
  }
}
