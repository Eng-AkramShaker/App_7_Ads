// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotask/controller/home_controller.dart';

import '../constes/colormanager.dart';

class Drop_Down_Items extends StatefulWidget {
  Drop_Down_Items({
    super.key,
    required this.title,
    required this.genderItems,
  });

  String title;
  List genderItems;

  @override
  State<Drop_Down_Items> createState() => _Drop_Down_ItemsState();
}

class _Drop_Down_ItemsState extends State<Drop_Down_Items> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final crlHome = Provider.of<Controller_Home>(context, listen: false);

    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Center(
                  child: Text(
                    crlHome.selectedValue_items ?? widget.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          items: widget.genderItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ))
              .toList(),
          value: crlHome.selectedValue_items,
          onChanged: (value) {
            setState(() {
              crlHome.selectedValue_items = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: size.width / 3,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: ColorManager.primary,
              ),
              color: Colors.white,
            ),
            elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 22,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
          ),
          underline: Container(),
          dropdownStyleData: DropdownStyleData(
            maxHeight: size.height / 3,
            width: size.width / 2.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: ColorManager.b_69,
            ),
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}

// =========================================================================================

class Drop_Down_City extends StatefulWidget {
  Drop_Down_City({
    super.key,
    required this.title,
    required this.genderItems,
  });

  String title;
  List genderItems;

  @override
  State<Drop_Down_City> createState() => _Drop_Down_CityState();
}

class _Drop_Down_CityState extends State<Drop_Down_City> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final crlHome = Provider.of<Controller_Home>(context, listen: false);

    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Center(
                  child: Text(
                    crlHome.selectedValue_City ?? widget.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          items: widget.genderItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ))
              .toList(),
          value: crlHome.selectedValue_City,
          onChanged: (value) {
            setState(() {
              crlHome.selectedValue_City = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: size.width / 3,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: ColorManager.primary,
              ),
              color: Colors.white,
            ),
            elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 22,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
          ),
          underline: Container(),
          dropdownStyleData: DropdownStyleData(
            maxHeight: size.height / 3,
            width: size.width / 2.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: ColorManager.b_69,
            ),
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}
