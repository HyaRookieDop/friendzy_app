import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friendzy_app/components/back_top_button.dart';
import 'package:friendzy_app/components/button.dart';
import 'package:friendzy_app/components/login_button.dart';
import 'package:friendzy_app/components/phone_field.dart';
import 'package:friendzy_app/utils/asset_path.dart';
import 'package:friendzy_app/utils/colours.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.kBackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackTopButton(),
            SizedBox(height: 16.w),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.titleLarge,
                )),
            SizedBox(height: 16.w),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Enter your phone number to login",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
            SizedBox(height: 24.w),
            Container(
              width: double.infinity,
              // duration: const Duration(milliseconds: 1500),
              decoration: BoxDecoration(
                color: Colours.kWhite,
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16).w,
              child: const SizedBox(
                child: PhoneField(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button(
                        child: Text('Login',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colours.kWhite))),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0.w),
                      child: Text(
                        "OR",
                        style: TextStyle(
                            color: Colours.kBlack.withOpacity(0.3),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp),
                      ),
                    ),
                    LoginButton(
                      svgs: ['google'.svg, 'IPhone'.svg],
                      texts: const ['Login with Phone', 'Login with Apple'],
                      backgroundColors: const [Colors.white, Colors.white],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
