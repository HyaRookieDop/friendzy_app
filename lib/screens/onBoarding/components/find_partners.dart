import 'package:friendzy_app/utils/asset_path.dart';
import 'package:friendzy_app/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FindPartners extends StatefulWidget {
  const FindPartners({super.key, required this.animationController});
  final AnimationController animationController;

  @override
  State<FindPartners> createState() => _FindPartnersState();
}

class _FindPartnersState extends State<FindPartners> {
  @override
  Widget build(BuildContext context) {
    final fristHalfAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)));
    final secondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));
    return SlideTransition(
      position: fristHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  top: 69,
                  child: SvgPicture.asset(
                    "dotted_line".svg,
                    fit: BoxFit.contain,
                  )),
              Positioned(
                  left: 48,
                  top: 108,
                  child: Container(
                    width: 132,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80),
                            bottomLeft: Radius.circular(80)),
                        image: DecorationImage(
                            image: AssetImage("men/1".webp),
                            fit: BoxFit.cover)),
                  )),
              Positioned(
                  top: 164,
                  right: 48,
                  child: Container(
                    width: 132,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Colours.kSecondary2,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80),
                            bottomRight: Radius.circular(80)),
                        image: DecorationImage(
                          image: AssetImage("women/2".webp),
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter,
                        )),
                  )),
              Positioned(
                  top: 124,
                  left: 144,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    decoration: BoxDecoration(
                        color: Colours.kSecondary1,
                        borderRadius: BorderRadius.circular(32.0)),
                    child: Text(
                      "100% Match",
                      style: TextStyle(
                          color: Colours.kWhite,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
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
                          "Find your preferences partners",
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 2, right: 2, top: 12),
                          child: Text(
                            "Join us with other millions of people and find your best matches",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colours.kBlack),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
