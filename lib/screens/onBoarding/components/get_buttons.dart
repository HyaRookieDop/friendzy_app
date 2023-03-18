import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friendzy_app/components/button.dart';
import 'package:friendzy_app/components/login_button.dart';
import 'package:friendzy_app/utils/asset_path.dart';
import 'package:friendzy_app/utils/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetButtons extends StatefulWidget {
  const GetButtons(
      {super.key,
      required this.animationController,
      required this.onNextClick});
  final AnimationController animationController;
  final VoidCallback onNextClick;

  @override
  State<GetButtons> createState() => _GetButtonsState();
}

class _GetButtonsState extends State<GetButtons> {
  @override
  Widget build(BuildContext context) {
    final fristHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(0.0, 0.2, curve: Curves.fastOutSlowIn)));
    final fristLastAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 1))
            .animate(CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));
    final secondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));
    return Padding(
      padding: EdgeInsets.only(
          bottom: ScreenUtil().bottomBarHeight, left: 40.w, right: 40.w),
      child: Stack(
        children: [
          SlideTransition(
            position: fristHalfAnimation,
            child: SlideTransition(
              position: fristLastAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Button(
                      onPressed: widget.onNextClick,
                      child: Text(
                        'Continue',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colours.kWhite),
                      )),
                  Button(
                      color: Colours.kSecondary1.withOpacity(0.1),
                      child: Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ],
              ),
            ),
          ),
          SlideTransition(
            position: secondHalfAnimation,
            child: LoginButton(
              svgs: ['phone'.svg, 'google'.svg],
              texts: const ['Login with Phone', 'Login with Google'],
              callBacks: [widget.onNextClick],
              textColors: [Colors.white, Colours.kPrimary],
            ),
          )
        ],
      ),
    );
  }
}
