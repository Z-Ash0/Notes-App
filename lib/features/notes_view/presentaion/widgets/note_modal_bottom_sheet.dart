import 'package:flutter/material.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/custom_elevated_button.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/custom_text_field.dart';

class NoteModalBottomSheet extends StatelessWidget {
  const NoteModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 40),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      child: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(hintText: 'Title'),
                  SizedBox(height: 20),
                  CustomTextField(hintText: 'Content', maxLines: 5),
                ],
              ),
            ),
          ),
          CustomElevatedButton(),
        ],
      ),
    );
  }
}
