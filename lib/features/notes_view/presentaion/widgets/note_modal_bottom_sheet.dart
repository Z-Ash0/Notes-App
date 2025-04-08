import 'package:flutter/material.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/custom_elevated_button.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/custom_text_field.dart';

class NoteModalBottomSheet extends StatefulWidget {
  const NoteModalBottomSheet({super.key});

  @override
  State<NoteModalBottomSheet> createState() => _NoteModalBottomSheetState();
}

class _NoteModalBottomSheetState extends State<NoteModalBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          20, 0, 20, MediaQuery.viewInsetsOf(context).bottom),
      margin: const EdgeInsets.symmetric(vertical: 40),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                      hintText: 'Title', controller: titleController),
                  const SizedBox(height: 20),
                  CustomTextField(
                      hintText: 'Content',
                      maxLines: 5,
                      controller: descriptionController),
                ],
              ),
            ),
          ),
          CustomElevatedButton(
              title: titleController.text,
              description: descriptionController.text),
        ],
      ),
    );
  }
}
