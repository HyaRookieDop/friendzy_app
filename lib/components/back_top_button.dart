import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friendzy_app/config/application.dart';
import 'package:friendzy_app/utils/colours.dart';

class BackTopButton extends StatelessWidget {
  const BackTopButton({super.key});

  void backRoute(context) {
    Application.router.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
          shape: CircleBorder(
              side: BorderSide(color: Colours.kBlack.withOpacity(0.08)))),
      child: InkWell(
        onTap: () => backRoute(context),
        borderRadius: BorderRadius.circular(40.r),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colours.kBlack,
        ),
      ),
    );
  }
}
