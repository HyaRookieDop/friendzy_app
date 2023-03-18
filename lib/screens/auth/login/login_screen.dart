import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friendzy_app/components/back_top_button.dart';
import 'package:friendzy_app/entity/country.dart';
import 'package:friendzy_app/utils/asset_path.dart';
import 'package:friendzy_app/utils/colours.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<Country> countrys = [];
  String _selectedItem = '';

  @override
  void initState() {
    getCountrys();
    super.initState();
  }

  void getCountrys() async {
    String countryData =
        await rootBundle.loadString('assets/json/country.json');
    setState(() {
      countrys = (json.decode(countryData) as List)
          .map((e) => Country.fromJson(e))
          .toList();
      _selectedItem = countrys.first.code;
    });
  }

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
                    Theme(
                      data: ThemeData().copyWith(
                          buttonTheme: ButtonTheme.of(context)
                              .copyWith(alignedDropdown: false)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(8),
                          menuMaxHeight: 500,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colours.kBlack.withOpacity(0.3),
                          ),
                          value: _selectedItem,
                          items: countrys
                              .map((e) => DropdownMenuItem(
                                    value: e.code,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "country/${e.code}".svg,
                                          width: 24,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(e.prefix)
                                      ],
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedItem = value ?? '';
                            });
                          },
                        ),
                      ),
                    ),
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
