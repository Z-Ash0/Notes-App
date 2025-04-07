import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final bool isDone;
  @HiveField(3)
  final String date;

  NoteModel(
      {required this.title,
      required this.description,
      required this.isDone,
      required this.date});
}
