// ignore: must_be_immutable
import 'package:todotask/utils/constants/ColorManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  String? lable;
  Widget? icon;
  Widget? suffixIcon;
  Color? filledColor;
  bool? isMobile;
  bool? centerText;
  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;
  bool hasPassword;
  bool? isEmail;
  bool? passwordIdentical;
  bool? isPhoneCode;
  bool? isFinal;
  bool? isEditable;
  bool? isNotes;
  bool? hasBorder;
  Function? onFieldSubmitted;
  Function(String)? onChanged;
  Function? onSaved;
  bool? readOnly;
  TextStyle? style;
  FormFieldValidator? validator;
  String? hintText;
  String? initialValue;
  TextStyle? hintStyle;
  TextStyle? lableStyle;
  int? maxLine;
  double? fontSize;
  double? height;
  double? width;

  TextInputType? textInputType;
  double radius;
  Color? borderColor;
  Color? cursorColor;
  int? maxLength;
  bool? borderRaduisOnly;
  TextAlign? textAlign;
  double? containerHeight;

  String? errorText;
  CustomTextField({
    super.key,
    this.errorText,
    this.radius = 10,
    this.fontSize,
    this.icon,
    this.borderColor,
    this.cursorColor,
    this.lable,
    this.filledColor,
    this.hasBorder = true,
    this.isEditable = true,
    this.isNotes = false,
    this.centerText = false,
    this.isFinal = false,
    this.isPhoneCode = false,
    this.isMobile = false,
    this.isEmail = false,
    this.passwordIdentical,
    this.hasPassword = false,
    this.controller,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.height,
    this.width,
    this.onChanged,
    this.onSaved,
    this.readOnly,
    this.style,
    this.validator,
    this.hintText,
    this.initialValue,
    this.hintStyle,
    this.lableStyle,
    this.maxLine,
    this.inputFormatters,
    this.textInputType,
    this.maxLength,
    this.borderRaduisOnly,
    this.textAlign,
    this.containerHeight,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = true;

  List<String> codes = ['+20'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height ?? 60,
      child: TextFormField(
        maxLength: widget.maxLength,
        validator: widget.validator,
        // textDirection: TextDirection.rtl,
        key: widget.key,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly ?? false,
        // style: widget.style,
        style: widget.style ?? const TextStyle(fontSize: 14, color: Colors.white),
        controller: widget.controller,
        textAlign: widget.textAlign ?? TextAlign.center,
        keyboardType: widget.textInputType,
        enabled: widget.isEditable,
        textInputAction: TextInputAction.next,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        obscureText: (widget.hasPassword) ? showPassword : widget.hasPassword,
        maxLines: widget.maxLine ?? ((widget.isNotes!) ? 3 : 1),
        // textAlign: (widget.centerText!) ? TextAlign.center : TextAlign.right,
        cursorColor: widget.cursorColor ?? Colors.white,
        decoration: InputDecoration(
          errorText: widget.errorText,
          counterText: '',
          hintText: widget.hintText,
          hintStyle:
              widget.hintStyle != null ? widget.hintStyle : TextStyle(color: ColorManager.borderColor, fontSize: widget.fontSize),
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: (!widget.hasBorder!)
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide:
                      BorderSide(width: 0.5, color: widget.borderColor != null ? widget.borderColor! : ColorManager.borderColor)),
          disabledBorder: (!widget.hasBorder!)
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide:
                      BorderSide(width: 0.5, color: widget.borderColor != null ? widget.borderColor! : ColorManager.borderColor)),
          border: (!widget.hasBorder!)
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide:
                      BorderSide(width: 0.5, color: widget.borderColor != null ? widget.borderColor! : ColorManager.borderColor)),
          focusedBorder: (!widget.hasBorder!)
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide:
                      BorderSide(width: 0.5, color: widget.borderColor != null ? widget.borderColor! : ColorManager.borderColor)),
          labelText: widget.lable,
          labelStyle: widget.lableStyle ??
              TextStyle(
                color: ColorManager.b_69,
              ),
          prefixIcon: widget.icon,
          fillColor: (widget.filledColor == null) ? Colors.transparent : widget.filledColor,
          filled: true,
          suffixIcon: (widget.hasPassword)
              ? InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                  child: (!showPassword)
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: ColorManager.b_69,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: ColorManager.b_69,
                        ),
                )
              : (!widget.isPhoneCode!)
                  ? widget.suffixIcon
                  : Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(),
                    ),
        ),
      ),
    );
  }
}
