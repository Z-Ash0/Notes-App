import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/cubit/notes_states.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(InitialState());
}
