import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_mobile/enum/pos_text_formfield_validation_rule.dart';
import 'package:pos_mobile/helper/style.dart';

class PosTextFormfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscure;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  final PosTextFormfieldValidationRule? rule;

  const PosTextFormfield({
    super.key,
    this.controller,
    this.placeholder,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscure = false,
    this.rule,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      keyboardType: _getKeyboardType(),
      obscureText: isObscure,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: StyleColor.filledBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        hintText: placeholder,
        hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: label,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: StyleColor.primary, width: 1.5),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  TextInputType _getKeyboardType() {
    switch (rule) {
      case PosTextFormfieldValidationRule.email:
        return TextInputType.emailAddress;
      case PosTextFormfieldValidationRule.phone:
        return TextInputType.phone;
      case PosTextFormfieldValidationRule.decimalNumber:
        return TextInputType.numberWithOptions(decimal: true);
      case PosTextFormfieldValidationRule.digitNumber:
        return TextInputType.number;
      case PosTextFormfieldValidationRule.password:
        return TextInputType.visiblePassword;
      default:
        return TextInputType.text;
    }
  }
}
