import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/cubit/notes_cubit.dart';
import 'package:notes_app/core/cubit/notes_states.dart';
import 'package:notes_app/core/database/note_model.dart';
import 'package:notes_app/core/utils/app_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.title, required this.description});
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is NotesCreateLoadedState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return state is NotesCreateLoadingState
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: () {
                  NoteModel note = NoteModel(
                      title: title,
                      description: description,
                      isDone: false,
                      date: DateFormat('mm/dd/yyyy').format(DateTime.now()),
                      color: 0xff00ff84);
                  context.read<NotesCubit>().addNote(note);
                  context.read<NotesCubit>().viewNotes();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                    fixedSize:
                        Size.fromWidth(MediaQuery.of(context).size.width),
                    padding: const EdgeInsets.symmetric(vertical: 15)),
                child: const Text('Add'),
              );
      },
    );
  }
}
