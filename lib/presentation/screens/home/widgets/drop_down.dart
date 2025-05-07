// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/ColorManager.dart';

class Drop_Down_Items extends StatefulWidget {
  Drop_Down_Items({
    super.key,
    required this.w,
    required this.title,
    required this.selectedValue,
    required this.genderItems,
    required this.onChanged,
  });

  final double w;
  final String title;
  String selectedValue;
  List genderItems;
  final ValueChanged<String> onChanged;

  @override
  State<Drop_Down_Items> createState() => _Drop_Down_ItemsState();
}

class _Drop_Down_ItemsState extends State<Drop_Down_Items> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                    widget.selectedValue.isNotEmpty ? widget.selectedValue : widget.title,
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
          value: widget.selectedValue.isNotEmpty ? widget.selectedValue : null,
          onChanged: (value) {
            widget.onChanged(value!);
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: widget.w,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: ColorManager.primary,
              ),
              color: Colors.white,
            ),
            elevation: 1,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 22,
            iconEnabledColor: ColorManager.primary,
            iconDisabledColor: Colors.grey,
          ),
          underline: Container(),
          dropdownStyleData: DropdownStyleData(
            maxHeight: size.height / 3,
            width: widget.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: ColorManager.b_69,
            ),
            // offset: const Offset(0, 0),
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
  final double w;
  final String title;
  final String selectedValueCity;
  final List cityItems;
  final ValueChanged<String> onChanged;

  Drop_Down_City({
    super.key,
    required this.w,
    required this.title,
    required this.selectedValueCity,
    required this.cityItems,
    required this.onChanged,
  });

  @override
  State<Drop_Down_City> createState() => _DropDownCityState();
}

class _DropDownCityState extends State<Drop_Down_City> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                    widget.selectedValueCity.isNotEmpty ? widget.selectedValueCity : widget.title,
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
          items: widget.cityItems
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
          value: widget.selectedValueCity.isNotEmpty ? widget.selectedValueCity : null,
          onChanged: (value) {
            widget.onChanged(value!);
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: widget.w,
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
            iconEnabledColor: ColorManager.primary,
            iconDisabledColor: Colors.grey,
          ),
          underline: Container(),
          dropdownStyleData: DropdownStyleData(
            maxHeight: size.height / 3,
            width: widget.w,
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
