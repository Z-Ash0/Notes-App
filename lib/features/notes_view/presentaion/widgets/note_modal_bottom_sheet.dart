import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/cubit/notes_cubit.dart';
import 'package:notes_app/core/cubit/notes_states.dart';
import 'package:notes_app/core/database/note_model.dart';
import 'package:notes_app/core/widgets/elevated_button_style.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/add_note_color_list_item.dart';
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
      // padding: const EdgeInsets.all(30),
      margin: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _addNoteTextFields(),
          const AddNoteColorListItems(),
          _addNoteHandleStates(),
        ],
      ),
    );
  }

  Widget _addNoteHandleStates() {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is NotesCreateLoadedState) {
          BlocProvider.of<NotesCubit>(context).viewNotes();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is NotesCreateLoadingState,
          child: _addNoteButton(context),
        );
      },
    );
  }

  Widget _addNoteButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {
          NoteModel note = NoteModel(
            title: titleController.text,
            description: descriptionController.text,
            isDone: false,
            date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
          );
          context.read<NotesCubit>().addNote(note);
        },
        style: elevatedButtonStyle(context),
        child: const Text('Add'),
      ),
    );
  }

  Widget _addNoteTextFields() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CustomTextField(hintText: 'Title', controller: titleController),
          const SizedBox(height: 20),
          CustomTextField(
              hintText: 'Content',
              maxLines: 5,
              controller: descriptionController),
        ],
      ),
    );
  }
}
