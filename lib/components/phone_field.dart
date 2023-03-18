import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friendzy_app/entity/country.dart';
import 'package:friendzy_app/utils/asset_path.dart';
import 'package:friendzy_app/utils/colours.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({super.key});

  @override
  State<StatefulWidget> createState() => PhoneFiledState();
}

class PhoneFiledState extends State<PhoneField> {
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
    return Theme(
      data: ThemeData().copyWith(
          buttonTheme:
              ButtonTheme.of(context).copyWith(alignedDropdown: false)),
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
    );
  }
}
