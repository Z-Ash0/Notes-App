import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/database/note_model.dart';
import 'package:notes_app/core/utils/app_constants.dart';
import 'package:notes_app/features/notes_view/presentaion/view/notes_view.dart';
import 'package:path_provider/path_provider.dart';

Box? notesBox;
void main() async {
  notesBox = await openHiveBox(notesBoxName);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NotesView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

Future<Box> openHiveBox(String box) async {
  if (!Hive.isBoxOpen(box)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return await Hive.openBox(box);
}
