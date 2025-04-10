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
      padding: const EdgeInsets.all(40),
      margin: EdgeInsets.fromLTRB(
          40, 0, 40, MediaQuery.viewInsetsOf(context).bottom),
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
              title: titleController, description: descriptionController),
        ],
      ),
    );
  }
}
