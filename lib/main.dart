import 'package:flutter/material.dart';
import 'package:notes_app/features/notes_view/presentaion/view/notes_view.dart';

void main() {
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
