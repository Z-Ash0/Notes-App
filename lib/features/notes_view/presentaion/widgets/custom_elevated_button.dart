import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/app_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          textStyle: const TextStyle(fontSize: 18),
          fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
          padding: const EdgeInsets.symmetric(vertical: 15)),
      child: const Text('Add'),
    );
  }
}
