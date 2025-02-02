import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/custom_app_bar.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/custom_list_view.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/note_modal_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  final List<Color> colorList = const [
    Color.fromARGB(255, 228, 206, 172),
    Color.fromARGB(255, 220, 182, 162),
    Color.fromARGB(255, 163, 129, 95),
    Color.fromARGB(255, 156, 140, 130),
    Color.fromARGB(255, 156, 136, 122)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CustomAppBar(
                  title: 'Notes', appBarIcon: FontAwesomeIcons.magnifyingGlass),
              Expanded(
                child: CustomListView(colorList: colorList),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Colors.grey,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => const NoteModalBottomSheet(),
              barrierColor: Colors.black.withOpacity(0.5),
            );
          },
          child: const Icon(FontAwesomeIcons.plus),
        ),
      ),
    );
  }
}
