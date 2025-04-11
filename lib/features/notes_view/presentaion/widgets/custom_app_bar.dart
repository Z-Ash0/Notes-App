import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.appBarIcon,
      this.onPressed});
  final String title;
  final IconData appBarIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 28)),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(5),
              child: IconButton(onPressed: onPressed, icon: Icon(appBarIcon)))
        ],
      ),
    );
  }
}
