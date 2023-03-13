import 'dart:math';

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
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Stack(
            children: [
              CustomPaint(
                  size: Size.infinite,
                  painter:
                      SolarPainter(solars: _solars, animation: _animation)),
              Positioned(
                  left: 0,
                  bottom: 260 + MediaQuery.of(context).padding.bottom,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 48),
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
      Solar(imageInfo: women1, size: const Size(64, 64), radius: 0, begin: 0),
      Solar(
        imageInfo: women2,
        size: const Size(32, 32),
        radius: 100,
        begin: 0.17,
      ),
      Solar(imageInfo: men3, size: const Size(38, 38), radius: 100, begin: 0.7),
      Solar(
          imageInfo: women3, size: const Size(60, 60), radius: 145, begin: 0.6),
      Solar(
          imageInfo: men2, size: const Size(40, 40), radius: 145, begin: 0.46),
      Solar(
          imageInfo: message,
          size: const Size(24, 25),
          radius: 145,
          begin: 0.35),
      Solar(
          imageInfo: men1, size: const Size(40, 40), radius: 145, begin: 0.24),
      Solar(
          imageInfo: women4,
          size: const Size(44, 44),
          radius: 145,
          begin: 0.07),
      Solar(
          imageInfo: women5,
          size: const Size(38, 38),
          radius: 145,
          begin: 0.95),
      Solar(
          imageInfo: location,
          size: const Size(24, 26),
          radius: 145,
          begin: 0.8),
    ]);
  }
}
