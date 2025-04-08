import 'package:notes_app/core/database/note_model.dart';

sealed class NotesStates {}

final class InitialState extends NotesStates {}

//* Notes creation states
final class NotesCreateLoadingState extends InitialState {}

final class NotesCreateLoadedState extends InitialState {
  final NoteModel note;

  NotesCreateLoadedState({required this.note});
}

final class NotesCreateFailedState extends InitialState {
  final String errMsg;

  NotesCreateFailedState({required this.errMsg});
}

//* Notes view states
final class NotesGetLoadedState extends InitialState {
  final List<NoteModel> notes;

  NotesGetLoadedState({required this.notes});
}
