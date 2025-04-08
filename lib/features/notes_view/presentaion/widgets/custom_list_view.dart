import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/cubit/notes_cubit.dart';
import 'package:notes_app/core/database/note_model.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/note_card.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = context.read<NotesCubit>().notes ?? [];
    return ListView.builder(
      itemBuilder: (context, index) => NoteCard(
        note: notes[index],
      ),
      itemCount: notes.length,
    );
  }
}
