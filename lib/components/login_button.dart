import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friendzy_app/utils/colours.dart';

import 'button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      required this.texts,
      required this.svgs,
      this.callBacks,
      this.backgroundColors,
      this.textColors});
  final List<String> texts;
  final List<String> svgs;
  final List<VoidCallback>? callBacks;
  final List<Color>? backgroundColors;
  final List<Color>? textColors;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Button(
            padding: EdgeInsets.all(8.0.w),
            onPressed: callBacks?.first,
            alignment: Alignment.centerLeft,
            color: backgroundColors?.first,
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  margin: EdgeInsets.only(right: 50.0.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(99.r)),
                  child: Center(
                    child: SvgPicture.asset(svgs.first),
                  ),
                ),
                Text(
                  texts.first,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: textColors?.first),
                )
              ],
            )),
        Button(
            color:
                backgroundColors?.last ?? Colours.kSecondary1.withOpacity(0.1),
            padding: EdgeInsets.all(8.0.w),
            onPressed: callBacks?.last,
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  margin: EdgeInsets.only(right: 50.0.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(99.r)),
                  child: Center(
                    child: SvgPicture.asset(svgs.last),
                  ),
                ),
                Text(
                  texts.last,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: textColors?.last),
                ),
              ],
            )),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account?",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colours.kBlack.withOpacity(0.7)),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colours.kSecondary1,
                        fontWeight: FontWeight.w600),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
