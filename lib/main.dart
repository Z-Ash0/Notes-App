import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/cubit/notes_cubit.dart';
import 'package:notes_app/core/database/note_model.dart';
import 'package:notes_app/core/utils/app_constants.dart';
import 'package:notes_app/features/notes_view/presentaion/view/notes_view.dart';
import 'package:path_provider/path_provider.dart';

Box<NoteModel>? notesBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(NoteModelAdapter());
  notesBox = await openHiveBox<NoteModel>(notesBoxName);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => NotesCubit(),
        child: const NotesView(),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

Future<Box<T>> openHiveBox<T>(String box) async {
  if (!Hive.isBoxOpen(box)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return await Hive.openBox(box);
}
