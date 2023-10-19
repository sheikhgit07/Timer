import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loc_it/utilites/colors.dart';
import 'custom_text.dart';

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toLowerCase(), selection: newValue.selection);
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.enabled,
      this.obscureText,
      this.focusNode,
      this.onChanged,
      this.onSubmited,
      this.validation,
      this.controller,
      this.keyboardType,
      this.hintText,
      this.labelText,
      this.isFilled,
      this.isUnderlineInputBorder,
      this.isUnderlineInputBorderWidth,
      this.isOutlineInputBorder,
      this.isOutlineInputBorderColor,
      this.maxLength,
      this.fontSize,
      this.inputFormatter,
      this.onTap,
      this.fieldborderColor = blackColor,
      this.textFieldFillColor = whiteColor,
      this.fieldborderRadius = 7,
      this.maxLines,
      this.contentPaddingLeft,
      this.contentPaddingRight,
      this.contentPaddingTop,
      this.contentPaddingBottom,
      this.containerPadding,
      this.outlineTopLeftRadius = 7,
      this.outlineTopRightRadius = 7,
      this.outlineBottomLeftRadius = 7,
      this.outlineBottomRightRadius = 7,
      this.textColor,
      this.fontWeight,
      this.hintTextColor = blackColor,
      this.errorBorderColor,
      this.hintFontSize = 16,
      this.textFontSize,
      this.textAlign,
      this.prefixIcon,
      this.suffixIcon,
      this.isSearch = false,
      this.autofillHints,
      this.textInputAction,
      this.onEditingComplete,
      this.autofocus,
      this.suffix,
      this.suffixIconConstraints,
      this.prefixIconConstraints,
      this.labelColor,
      this.textHeight,
      this.hintWeight,
      this.errorFontSize,
      this.maxLengthEnforcement,
      Key? key,
      this.isPrice = false,
      this.isEmail = false,
      this.readOnly,
      this.textCapitalization = false})
      : super(key: key);
  bool? isPrice;
  bool? enabled;
  bool? obscureText;
  FontWeight? hintWeight;
  String? Function(String?)? validation;
  String? Function(String?)? onChanged;
  String? Function(String?)? onSubmited;
  Function()? onEditingComplete;
  void Function()? onTap;
  FocusNode? focusNode;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? hintText;
  String? labelText;
  bool? isFilled;
  bool? isUnderlineInputBorder;
  bool? isOutlineInputBorder;
  bool? autofocus;
  bool? isSearch;
  Color? isOutlineInputBorderColor;
  Color? labelColor;
  int? maxLength;
  int? maxLines;
  double? fontSize;
  FontWeight? fontWeight;
  double? isUnderlineInputBorderWidth;
  int? inputFormatter;
  Color? textFieldFillColor;
  Color? fieldborderColor;
  Color? textColor;
  Color? hintTextColor;
  Color? errorBorderColor;
  double? textFontSize;
  double? errorFontSize;

  double? hintFontSize;
  double? fieldborderRadius;
  double? contentPaddingTop;
  double? contentPaddingBottom;
  double? contentPaddingLeft;
  double? contentPaddingRight;
  double? containerPadding;
  double? outlineTopLeftRadius;
  double? outlineTopRightRadius;
  double? outlineBottomLeftRadius;
  double? outlineBottomRightRadius;
  double? textHeight;
  TextAlign? textAlign;
  Widget? prefixIcon;
  Widget? suffixIcon;
  var autofillHints;
  TextInputAction? textInputAction;
  Widget? suffix;
  bool? readOnly;
  BoxConstraints? suffixIconConstraints;
  BoxConstraints? prefixIconConstraints;
  bool? isEmail;
  bool textCapitalization = false;
  MaxLengthEnforcement? maxLengthEnforcement;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      enabled: enabled,
      readOnly: readOnly ?? false,
      autofocus: autofocus ?? false,
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      maxLengthEnforcement: maxLengthEnforcement ?? MaxLengthEnforcement.none,
      focusNode: focusNode,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      validator: validation,
      onChanged: onChanged,
      onFieldSubmitted: onSubmited,
      controller: controller,

      keyboardType: keyboardType,
      textAlign: textAlign ?? TextAlign.left,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      //  textAlignVertical:textAlign != null? TextAlignVertical.bottom:TextAlignVertical.center,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        suffixIconConstraints: suffixIconConstraints ?? null,
        contentPadding: EdgeInsets.only(
            left: contentPaddingLeft ?? 12,
            right: contentPaddingRight ?? 12,
            top: contentPaddingTop ?? 13,
            bottom: contentPaddingBottom ?? 13),
        isDense: true,
        hintText: hintText ?? "",
        hintStyle: TextStyle(
            fontWeight: hintWeight ?? FontWeight.w400,
            fontSize: hintFontSize ?? 14,
            color: hintTextColor!.withOpacity(.5)),
        label: hintText == null
            ? CustomText(
                title: labelText ?? "",
                color: labelColor,
              )
            : null,
        helperStyle: const TextStyle(color: Colors.transparent),
        errorStyle: TextStyle(color: Colors.red, fontSize: errorFontSize ?? 10),
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints ?? null,
        suffixIcon: suffixIcon,
        suffix: suffix,
        filled: true,
        fillColor: textFieldFillColor,
        border: isUnderlineInputBorder == false && isOutlineInputBorder == false
            ? InputBorder.none
            : isOutlineInputBorder == false
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: isUnderlineInputBorderWidth ?? 0.8,
                        color: isOutlineInputBorderColor == null
                            ? greyColor
                            : isOutlineInputBorderColor!))
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        width: isOutlineInputBorderColor != null ? 0 : 1,
                        color: isOutlineInputBorderColor ?? Colors.grey),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(outlineTopLeftRadius ?? 4),
                      topRight: Radius.circular(outlineTopRightRadius ?? 4),
                      bottomLeft: Radius.circular(outlineBottomLeftRadius ?? 4),
                      bottomRight:
                          Radius.circular(outlineBottomRightRadius ?? 4),
                    )),
        enabledBorder: isUnderlineInputBorder == false &&
                isOutlineInputBorder == false
            ? InputBorder.none
            : isOutlineInputBorder == false
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: isUnderlineInputBorderWidth ?? 0.8,
                        color: isOutlineInputBorderColor == null
                            ? greyColor
                            : isOutlineInputBorderColor!))
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        width: isOutlineInputBorderColor != null ? 0 : 1,
                        color: isOutlineInputBorderColor ?? Colors.grey),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(outlineTopLeftRadius ?? 4),
                      topRight: Radius.circular(outlineTopRightRadius ?? 4),
                      bottomLeft: Radius.circular(outlineBottomLeftRadius ?? 4),
                      bottomRight:
                          Radius.circular(outlineBottomRightRadius ?? 4),
                    )),
        focusedBorder: isUnderlineInputBorder == false &&
                isOutlineInputBorder == false
            ? InputBorder.none
            : isOutlineInputBorder == false
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: isUnderlineInputBorderWidth ?? 0.8,
                        color: isOutlineInputBorderColor == null
                            ? greyColor
                            : isOutlineInputBorderColor!))
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        width: isOutlineInputBorderColor != null ? 0 : 1,
                        color: isOutlineInputBorderColor ?? Colors.grey),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(outlineTopLeftRadius ?? 4),
                      topRight: Radius.circular(outlineTopRightRadius ?? 4),
                      bottomLeft: Radius.circular(outlineBottomLeftRadius ?? 4),
                      bottomRight:
                          Radius.circular(outlineBottomRightRadius ?? 4),
                    )),
        errorBorder: isUnderlineInputBorder == false &&
                isOutlineInputBorder == false
            ? InputBorder.none
            : isOutlineInputBorder == false
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: isUnderlineInputBorderWidth ?? 0.8,
                        color: redColor))
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        width: isOutlineInputBorderColor != null ? 0 : 1,
                        color: redColor),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(outlineTopLeftRadius ?? 4),
                      topRight: Radius.circular(outlineTopRightRadius ?? 4),
                      bottomLeft: Radius.circular(outlineBottomLeftRadius ?? 4),
                      bottomRight:
                          Radius.circular(outlineBottomRightRadius ?? 4),
                    )),
        disabledBorder: isUnderlineInputBorder == false &&
                isOutlineInputBorder == false
            ? InputBorder.none
            : isOutlineInputBorder == false
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: isUnderlineInputBorderWidth ?? 0.8,
                        color: isOutlineInputBorderColor == null
                            ? greyColor
                            : isOutlineInputBorderColor!))
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        width: isOutlineInputBorderColor != null ? 0 : 1,
                        color: isOutlineInputBorderColor ?? redColor),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(outlineTopLeftRadius ?? 4),
                      topRight: Radius.circular(outlineTopRightRadius ?? 4),
                      bottomLeft: Radius.circular(outlineBottomLeftRadius ?? 4),
                      bottomRight:
                          Radius.circular(outlineBottomRightRadius ?? 4),
                    )),
      ),
      inputFormatters: [
        textCapitalization
            ? UpperCaseTextFormatter()
            : isEmail!
                ? LowerCaseTextFormatter()
                : isPrice!
                    ? FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))
                    : keyboardType == TextInputType.number ||
                            keyboardType == TextInputType.phone
                        ? FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'))
                        : LengthLimitingTextInputFormatter(inputFormatter)
      ],
      style: TextStyle(
        color: textColor ?? blackColor,
        fontSize: textFontSize ?? 15,
        height: textHeight ?? 1,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
