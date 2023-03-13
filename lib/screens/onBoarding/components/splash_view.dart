import 'dart:async';
import 'package:friendzy_app/utils/asset_path.dart';
import 'package:friendzy_app/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.animationController});
  final AnimationController animationController;

  @override
  State<StatefulWidget> createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2500), () {
      widget.animationController.animateTo(0.2);
    });
  }

  @override
  Widget build(BuildContext context) {
    final leaveAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1.0, 0.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: leaveAnimation,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colours.kSecondary1,
        ),
        child: Stack(children: [
          Center(
            child: SvgPicture.asset(
              "logo".svg,
              width: 200,
            ),
          ),
          Positioned(
            right: 0,
            top: MediaQuery.of(context).padding.top + 18,
            child: SvgPicture.asset(
              "bubble".svg,
              width: 307,
              fit: BoxFit.cover,
            ),
          )
        ]),
      ),
    );
  }
}
