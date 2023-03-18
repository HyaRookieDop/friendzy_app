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
          bottom: MediaQuery.of(context).padding.bottom, left: 40, right: 40),
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
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      borderRadius: BorderRadius.circular(32),
                      color: Colours.kPrimary,
                      onPressed: widget.onNextClick,
                      child: Text(
                        'Continue',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colours.kWhite),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        borderRadius: BorderRadius.circular(32),
                        color: Colours.kSecondary1.withOpacity(0.1),
                        child: Text(
                          'Sign In',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
            ),
          ),
          SlideTransition(
            position: secondHalfAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(8.0),
                    borderRadius: BorderRadius.circular(32),
                    color: Colours.kPrimary,
                    onPressed: widget.onNextClick,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(right: 40.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(99)),
                          child: Center(
                            child: SvgPicture.asset("phone".svg),
                          ),
                        ),
                        Text(
                          'Login with Phone',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colours.kWhite),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: CupertinoButton(
                      padding: const EdgeInsets.all(8.0),
                      borderRadius: BorderRadius.circular(32),
                      color: Colours.kSecondary1.withOpacity(0.1),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(right: 40.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(99)),
                            child: Center(
                              child: SvgPicture.asset("google".svg),
                            ),
                          ),
                          Text(
                            'Login with Google',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      onPressed: () {}),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 16),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Colours.kSecondary1,
                                    fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
