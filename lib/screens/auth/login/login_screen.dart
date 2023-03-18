import 'package:flutter/material.dart';
import 'package:friendzy_app/components/back_top_button.dart';
import 'package:friendzy_app/components/phone_field.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackTopButton(),
            const SizedBox(height: 16),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.titleLarge,
                )),
            const SizedBox(height: 16),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Enter your phone number to login",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              // duration: const Duration(milliseconds: 1500),
              decoration: BoxDecoration(
                color: Colours.kWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SizedBox(
                child: Row(
                  children: [
                    const PhoneField(),
                    Container(
                      width: 1,
                      height: 24,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      color: Colours.kBlack.withOpacity(0.08),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        cursorColor: Colours.kSecondary1,
                        decoration: InputDecoration.collapsed(
                          hintText: "Enter phone number",
                          hintStyle:
                              TextStyle(color: Colours.kBlack.withOpacity(0.5)),
                          // errorText: "请输入合法手机号",
                        ),
                      ),
                    ),
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
