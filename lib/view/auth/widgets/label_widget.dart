import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_assign/res/app_constants.dart';

class LabelWidget extends StatelessWidget {
  final String text;

  const LabelWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Align(
            alignment: Alignment.topRight,
            child: Text(
              text,
              style: TextStyle(
                  color: AppConstants.grey,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Tajawal'),
            ),
          );
        });
  }
}
