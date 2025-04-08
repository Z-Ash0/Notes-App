import 'package:flutter/material.dart';
import 'package:notes_app/core/database/note_model.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/note_list_tile.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Color(note.color),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          NoteListTile(title: note.title, note: note.description),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: Text(
              note.date,
              style: TextStyle(color: Colors.black.withOpacity(0.3)),
            ),
          ),
        ],
      ),
    );
  }
}
