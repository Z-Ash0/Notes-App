import 'package:flutter/material.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/note_card.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.colorList,
  });

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, int index) => NoteCard(
        color: colorList[index % 5],
        title: 'Flutter tips',
        note: 'Build your career with me using flutter',
        date: 'may, 22, 2024',
      ),
      itemCount: 20,
    );
  }
}
