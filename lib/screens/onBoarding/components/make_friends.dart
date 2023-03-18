import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  top: 69.w,
                  child: SvgPicture.asset(
                    "dotted_line".svg,
                    width: ScreenUtil().screenWidth,
                    fit: BoxFit.fill,
                  )),
              Positioned(
                  right: 40.w,
                  top: 53.w,
                  child: Container(
                    padding: EdgeInsets.all(6.0.r),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colours.kWhite,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFFF6D1EB).withOpacity(0.78),
                              blurRadius: 60.r,
                              offset: const Offset(0, 20))
                        ]),
                    child: ClipOval(
                      child: Image.asset(
                        "women/1".webp,
                        width: 112.w,
                      ),
                    ),
                  )),
              Positioned(
                  left: 40.w,
                  top: 171.w,
                  child: Container(
                    padding: EdgeInsets.all(6.0.r),
                    decoration: BoxDecoration(
                        color: Colours.kSecondary1, shape: BoxShape.circle),
                    child: ClipOval(
                      child: Image.asset(
                        "women/2".webp,
                        width: 112.w,
                      ),
                    ),
                  )),
              Positioned(
                left: 78.w,
                top: 88.w,
                child: Container(
                  padding: const EdgeInsets.only(
                          top: 4.0, bottom: 6.0, left: 12.0, right: 12.0)
                      .w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
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
                left: 224.w,
                top: 266.w,
                child: Container(
                  padding: const EdgeInsets.only(
                          top: 4.0, bottom: 6.0, left: 12.0, right: 12.0)
                      .w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border:
                          Border.all(width: 1.0.w, color: Colours.kSecondary1)),
                  child: Text(
                    "👗 Fashion",
                    style: TextStyle(
                        color: Colours.kPrimary, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Positioned(
                right: 69.w,
                top: 169.w,
                child: Container(
                  padding: const EdgeInsets.only(
                          top: 4.0, bottom: 6.0, left: 12.0, right: 12.0)
                      .w,
                  decoration: BoxDecoration(
                      color: Colours.kWhite,
                      borderRadius: BorderRadius.circular(8.0.r)),
                  child: Text(
                    "You 👋",
                    style: TextStyle(
                        color: Colours.kPrimary, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                  right: 94.w,
                  top: 161.w,
                  child: Container(
                    padding: EdgeInsets.all(5.0.r),
                    decoration: BoxDecoration(
                        color: Colours.kWhite, shape: BoxShape.circle),
                    child: Container(
                        width: 6.0.w,
                        height: 6.0.w,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF4D8EF), shape: BoxShape.circle)),
                  )),
              Positioned(
                left: 64.w,
                top: 287.w,
                child: Container(
                  padding: const EdgeInsets.only(
                          top: 4.0, bottom: 6.0, left: 12.0, right: 12.0)
                      .w,
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
                  left: 94.w,
                  top: 279.w,
                  child: Container(
                    padding: EdgeInsets.all(5.0.r),
                    decoration: BoxDecoration(
                        color: Colours.kSecondary1, shape: BoxShape.circle),
                    child: Container(
                        width: 6.0.w,
                        height: 6.0.w,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF4D8EF), shape: BoxShape.circle)),
                  )),
              Positioned(
                  left: 0,
                  bottom: 172.w + ScreenUtil().bottomBarHeight,
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Column(
                      children: [
                        Text(
                          "Make friends with the people like you",
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 2, right: 2, top: 12)
                                  .w,
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
