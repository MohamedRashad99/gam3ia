import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamaya/app/config/theme.dart';
import 'package:jamaya/app/config/widget/inputs/default_form_field.dart';

class InputWidget extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String label;
  final bool isPassword;
  final bool error;
  final bool isNumber;
  final bool enable;
  final bool onlyEn;
  final String? initialValue;
  final bool show;
  final int? maxLength;
  final bool isCreateShop;
  final VoidCallback? onChangeVision;
  final int? maxLines;
  final ValueChanged<String>? onChange;

  const InputWidget({
    Key? key,
    required this.title,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge!.copyWith(
            color: AppColors.second,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        DefaultFormField(
          enable: enable,
          controller: controller,
          isNumber: isNumber,
          onChange: onChange,
          initialValue: initialValue,
          maxLines: maxLines,
          maxLength: maxLength,
          show: show,
          label: label,
          error: error,
          isCreateShop: isCreateShop,
          isPassword: isPassword,
          onChangeVision: onChangeVision,
          onlyEn: onlyEn,
        ),
      ],
    );
  }
}
