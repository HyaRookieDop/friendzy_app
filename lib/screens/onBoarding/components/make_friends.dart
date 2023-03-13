import 'package:friendzy_app/utils/asset_path.dart';
import 'package:friendzy_app/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MakeFriends extends StatelessWidget {
  const MakeFriends({super.key, required this.animationController});

  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    final fristHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: const Interval(0.0, 0.2, curve: Curves.fastOutSlowIn)));
    final secondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)));
    return SlideTransition(
      position: fristHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                  left: 0,
                  top: 69,
                  child: SvgPicture.asset(
                    "dotted_line".svg,
                    fit: BoxFit.contain,
                  )),
              Positioned(
                  right: 40,
                  top: 53,
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colours.kWhite,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFFF6D1EB).withOpacity(0.78),
                              blurRadius: 60,
                              offset: const Offset(0, 20))
                        ]),
                    child: ClipOval(
                      child: Image.asset(
                        "women/1".webp,
                        width: 112,
                      ),
                    ),
                  )),
              Positioned(
                  left: 40,
                  top: 171,
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colours.kSecondary1, shape: BoxShape.circle),
                    child: ClipOval(
                      child: Image.asset(
                        "women/2".webp,
                        width: 112,
                      ),
                    ),
                  )),
              Positioned(
                left: 78,
                top: 88,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 6.0, left: 12.0, right: 12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border:
                          Border.all(width: 1.0, color: Colours.kSecondary1)),
                  child: Text(
                    "🎵 Music",
                    style: TextStyle(
                        color: Colours.kPrimary, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Positioned(
                left: 224,
                top: 266,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 6.0, left: 12.0, right: 12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border:
                          Border.all(width: 1.0, color: Colours.kSecondary1)),
                  child: Text(
                    "👗 Fashion",
                    style: TextStyle(
                        color: Colours.kPrimary, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Positioned(
                right: 64,
                top: 169,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 6.0, left: 12.0, right: 12.0),
                  decoration: BoxDecoration(
                      color: Colours.kWhite,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    "You 👋",
                    style: TextStyle(
                        color: Colours.kPrimary, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                  right: 93,
                  top: 161,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colours.kWhite, shape: BoxShape.circle),
                    child: Container(
                        width: 6.0,
                        height: 6.0,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF4D8EF), shape: BoxShape.circle)),
                  )),
              Positioned(
                left: 60,
                top: 287,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 6.0, left: 12.0, right: 12.0),
                  decoration: BoxDecoration(
                      color: Colours.kSecondary1,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    "Clara 👋",
                    style: TextStyle(
                        color: Colours.kWhite, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                  left: 94,
                  top: 279,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colours.kSecondary1, shape: BoxShape.circle),
                    child: Container(
                        width: 6.0,
                        height: 6.0,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF4D8EF), shape: BoxShape.circle)),
                  )),
              Positioned(
                  left: 0,
                  bottom: 172 + MediaQuery.of(context).padding.bottom,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Column(
                      children: [
                        Text(
                          "Make friends with the people like you",
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 2, right: 2, top: 12),
                          child: Text(
                            "Interact with people with the same interest like you",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colours.kBlack),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
