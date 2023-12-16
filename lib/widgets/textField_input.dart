import 'package:flutter/material.dart';
import 'package:shoes_ui/utils/colors.dart';
import 'package:shoes_ui/views/app_textStyle.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const TextFieldInput({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderAll = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black),
    );
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: screenWidth > 768 ? Alignment.center : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: screenWidth > 768
              ? 0.5
              : 1.0, 
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: const Icon(
                Icons.search,
                color: iconColor,
              ),
              contentPadding: const EdgeInsets.all(9.0),
              hintStyle: appStyle(textColor, FontWeight.normal, 16),

              //instead of creating different OutlineInput border,we defined at top
              border: borderAll,
              focusedBorder: borderAll,
              enabledBorder: borderAll,
            ),
          ),
        ),
      ),
    );
  }
}
