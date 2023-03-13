import 'package:friendzy_app/screens/onBoarding/components/get_buttons.dart';
import 'package:friendzy_app/screens/onBoarding/components/splash_view.dart';
import 'package:friendzy_app/utils/colours.dart';
import 'package:flutter/material.dart';
import 'components/find_partners.dart';
import 'components/make_friends.dart';
import 'components/meeting_pepole.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colours.kWhite,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SplashView(animationController: _animationController),
            MakeFriends(
              animationController: _animationController,
            ),
            FindPartners(
              animationController: _animationController,
            ),
            MeetingPepole(
              animationController: _animationController,
            ),
            GetButtons(
              animationController: _animationController,
              onNextClick: onNextClick,
            )
          ],
        ));
  }

  void onNextClick() {
    if (_animationController.value >= 0 && _animationController.value <= 0.2) {
      _animationController.animateTo(0.4);
    } else if (_animationController.value > 0.2 &&
        _animationController.value <= 0.4) {
      _animationController.animateTo(0.6);
    } else if (_animationController.value > 0.4 &&
        _animationController.value <= 0.6) {
      _animationController.animateTo(0.8);
    }
  }
}
