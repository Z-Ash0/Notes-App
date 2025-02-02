import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/app_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.maxLines = 1});
  final String hintText;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: kPrimaryColor),
          enabledBorder: setBorderProperties(),
          focusedBorder: setBorderProperties()),
    );
  }
}

OutlineInputBorder setBorderProperties() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: Color.fromARGB(255, 194, 194, 194)),
  );
}
