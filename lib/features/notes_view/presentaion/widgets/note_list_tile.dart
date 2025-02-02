import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteListTile extends StatelessWidget {
  const NoteListTile({
    super.key,
    required this.title,
    required this.note,
  });

  final String title;
  final String note;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 26),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Text(
          note,
          style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 18),
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          FontAwesomeIcons.trash,
          color: Colors.black,
        ),
      ),
    );
  }
}
