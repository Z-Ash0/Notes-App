import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/core/cubit/notes_cubit.dart';
import 'package:notes_app/core/database/note_model.dart';

class NoteListTile extends StatelessWidget {
  const NoteListTile({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        note.title,
        style: const TextStyle(color: Colors.black, fontSize: 26),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Text(
          note.description,
          style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 18),
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          note.delete();
          context.read<NotesCubit>().viewNotes();
        },
        icon: const Icon(
          FontAwesomeIcons.trash,
          color: Colors.black,
        ),
      ),
    );
  }
}
