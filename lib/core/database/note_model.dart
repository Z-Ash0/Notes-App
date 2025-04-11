import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  bool isDone;
  @HiveField(3)
  final String date;
  @HiveField(4)
  int color;

  NoteModel({
    this.title = 'title undefined',
    this.description = 'no description',
    this.isDone = false,
    required this.date,
    this.color = 0xff00ff84,
  });
}
