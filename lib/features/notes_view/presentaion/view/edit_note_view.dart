import 'package:flutter/material.dart';
import 'package:notes_app/core/database/note_model.dart';
import 'package:notes_app/core/utils/app_constants.dart';
import 'package:notes_app/core/widgets/elevated_button_style.dart';
import 'package:notes_app/features/notes_view/presentaion/view/notes_view.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/add_note_color_list_item.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/custom_app_bar.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _editNotesBody(context),
      ),
    );
  }

  Widget _editNotesBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppBar(
            title: 'Edit a note',
            appBarIcon: Icons.done,
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NotesView(),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          _editNotesTxtFieds(),
          const Expanded(child: SizedBox()),
          EditNoteColorList(note: widget.note),
          const Expanded(child: SizedBox()),
          _editElevatedButton(context),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget _editElevatedButton(BuildContext context) {
    return ElevatedButton(
      style: elevatedButtonStyle(context),
      onPressed: () {
        widget.note.title = titleController.text.isEmpty
            ? widget.note.title
            : titleController.text;
        widget.note.description = contentController.text.isEmpty
            ? widget.note.description
            : contentController.text;
        widget.note.save();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NotesView()));
      },
      child: const Text('edit'),
    );
  }

  Widget _editNotesTxtFieds() {
    return Column(
      children: [
        CustomTextField(
            hintText: widget.note.title, controller: titleController),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: widget.note.description,
          controller: contentController,
          maxLines: 5,
        ),
      ],
    );
  }
}

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = colorList.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
              widget.note.color = colorList[index].value;
            });
          },
          child: ColorItem(
              color: colorList[index], isSelected: currentIndex == index),
        ),
      ),
    );
  }
}
