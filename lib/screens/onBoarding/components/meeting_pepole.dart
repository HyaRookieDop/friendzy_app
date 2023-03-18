import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friendzy_app/entity/solar.dart';
import 'package:friendzy_app/screens/onBoarding/widgets/solar_painter.dart';
import 'package:friendzy_app/utils/asset_img.dart';
import 'package:friendzy_app/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MeetingPepole extends StatefulWidget {
  const MeetingPepole({super.key, required this.animationController});
  final AnimationController animationController;

  @override
  State<MeetingPepole> createState() => _MeetingPepoleState();
}

class _MeetingPepoleState extends State<MeetingPepole>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  final List<Solar> _solars = [];

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        // print(_animation.value);
        setState(() {});
      });
    // widget.animationController.addListener(() {
    //   if (widget.animationController.value >= 0.45) {
    //     _controller.repeat();
    //   }
    // });

    _loadSolars();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fristHalfAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));
    return SlideTransition(
      position: fristHalfAnimation,
      child: Padding(
          padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
          child: Stack(
            children: [
              CustomPaint(
                  size: Size.infinite,
                  painter:
                      SolarPainter(solars: _solars, animation: _animation)),
              Positioned(
                  left: 0,
                  bottom: 260.w + ScreenUtil().bottomBarHeight,
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Column(
                      children: [
                        Text(
                          "Let’s meeting new people around you",
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }

  void _loadSolars() async {
    ui.Image women1 = await AssetImg.askImage('women/1'.webp);
    ui.Image women2 = await AssetImg.askImage('women/2'.webp);
    ui.Image women3 = await AssetImg.askImage('women/3'.webp);
    ui.Image women4 = await AssetImg.askImage('women/4'.webp);
    ui.Image women5 = await AssetImg.askImage('women/5'.webp);

    ui.Image men3 = await AssetImg.askImage('men/3'.webp);
    ui.Image men2 = await AssetImg.askImage('men/2'.webp);
    ui.Image men1 = await AssetImg.askImage('men/1'.webp);

    ui.Image location = await AssetImg.askImage('location'.png);
    ui.Image message = await AssetImg.askImage('message'.png);

    _solars.addAll([
      Solar(imageInfo: women1, size: Size(64.w, 64.w), radius: 0, begin: 0),
      Solar(
        imageInfo: women2,
        size: Size(32.w, 32.w),
        radius: 100.r,
        begin: 0.17,
      ),
      Solar(imageInfo: men3, size: Size(38.w, 38.w), radius: 100.r, begin: 0.7),
      Solar(
          imageInfo: women3, size: Size(60.w, 60.w), radius: 145.r, begin: 0.6),
      Solar(
          imageInfo: men2, size: Size(40.w, 40.w), radius: 145.r, begin: 0.46),
      Solar(
          imageInfo: message, size: Size(24.w, 25.w), radius: 145, begin: 0.35),
      Solar(
          imageInfo: men1, size: Size(40.w, 40.w), radius: 145.r, begin: 0.24),
      Solar(
          imageInfo: women4,
          size: Size(44.w, 44.w),
          radius: 145.r,
          begin: 0.07),
      Solar(
          imageInfo: women5,
          size: Size(38.w, 38.w),
          radius: 145.r,
          begin: 0.95),
      Solar(
          imageInfo: location,
          size: Size(24.w, 26.w),
          radius: 145.r,
          begin: 0.8),
    ]);
  }
}
