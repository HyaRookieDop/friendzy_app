import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friendzy_app/utils/colours.dart';

enum ButtonSize { small, medium, large }

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.child,
      this.size,
      this.color,
      this.onPressed,
      this.radius,
      this.padding,
      this.margin,
      this.alignment});

  final ButtonSize? size;
  final Color? color;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Alignment? alignment;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin ?? EdgeInsets.only(bottom: 16.w),
      child: CupertinoButton(
        alignment: alignment ?? Alignment.center,
        padding: padding ?? EdgeInsets.symmetric(vertical: 16.0.w),
        borderRadius: BorderRadius.circular(radius ?? 32.r),
        color: color ?? Colours.kPrimary,
        onPressed: onPressed ?? () {},
        child: child,
      ),
    );
  }
}
