import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/core/cubit/notes_cubit.dart';
import 'package:notes_app/core/utils/app_constants.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/custom_app_bar.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/custom_list_view.dart';
import 'package:notes_app/features/notes_view/presentaion/widgets/note_modal_bottom_sheet.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    context.read<NotesCubit>().viewNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomAppBar(
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
