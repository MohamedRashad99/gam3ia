import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final bool isPassword;
  final bool error;
  final bool enable;
  final bool isNumber;
  final bool onlyEn;
  final String? initialValue;
  final bool show;
  final int? maxLength;
  final bool isCreateShop;
  final VoidCallback? onChangeVision;
  final int? maxLines;
  final ValueChanged<String>? onChange;

  const DefaultFormField({
    Key? key,
    this.controller,
    required this.label,
    this.onChangeVision,
    this.onChange,
    this.maxLines,
    this.error = false,
    this.isNumber = false,
    this.onlyEn = false,
    this.enable = true,
    this.show = false,
    this.maxLength,
    this.isCreateShop = false,
    this.isPassword = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      controller: controller,
      onChanged: onChange,
      initialValue: initialValue,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      obscureText: show,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumber
          ? [
              FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
            ]
          : [],
      decoration: InputDecoration(
        hintStyle: context.textTheme.titleLarge!
            .copyWith(fontSize: 18, color: const Color(0xFFc5c5c5)),
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: error ? AppColors.primary : const Color(0xFFCDCCCC),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: error ? AppColors.primary : const Color(0xFFCDCCCC),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: error ? AppColors.primary : const Color(0xFFCDCCCC),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: error ? AppColors.primary : const Color(0xFFCDCCCC),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        suffixIcon: isPassword
            ? Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 14,
                ),
                child: IconButton(
                  onPressed: onChangeVision,
                  icon: show
                      ? const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.grey,
                        ),
                ),
              )
            : null,
      ),
    );
  }
}
