sealed class NotesStates {}

final class InitialState extends NotesStates {}

//* Notes creation states
final class NotesCreateLoadingState extends InitialState {}

final class NotesCreateLoadedState extends InitialState {}

final class NotesCreateFailedState extends InitialState {}

//* Notes view states
final class NotesGetLoadingState extends InitialState {}

final class NotesGetLoadedState extends InitialState {}

final class NotesGetFailedState extends InitialState {}

//* Notes deletion states
final class NotesDeleteLoadingState extends InitialState {}

final class NotesDeleteLoadedState extends InitialState {}

final class NotesDeleteFailedState extends InitialState {}
