import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/cubit/notes_states.dart';
import 'package:notes_app/core/database/note_model.dart';
import 'package:notes_app/main.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(InitialState());

  List<NoteModel>? notes;
  Color color = const Color(0xff0BC066);

  void addNote(NoteModel note) {
    emit(NotesCreateLoadingState());
    try {
      note.color = color.value;
      notesBox.add(note);
      viewNotes();
      emit(NotesCreateLoadedState(note: note));
    } catch (e) {
      emit(NotesCreateFailedState(errMsg: e.toString()));
    }
  }

  void viewNotes() {
    notes = notesBox.values.toList();
    emit(NotesGetLoadedState());
  }

  void deleteNote(NoteModel note) {
    notesBox.delete(note);
    viewNotes();
  }
}
