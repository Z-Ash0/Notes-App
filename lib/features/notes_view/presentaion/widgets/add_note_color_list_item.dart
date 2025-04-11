import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/cubit/notes_cubit.dart';
import 'package:notes_app/core/utils/app_constants.dart';

class AddNoteColorListItems extends StatefulWidget {
  const AddNoteColorListItems({super.key});

  @override
  State<AddNoteColorListItems> createState() => _AddNoteColorListItemsState();
}

class _AddNoteColorListItemsState extends State<AddNoteColorListItems> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colorList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
              context.read<NotesCubit>().color = colorList[index];
            });
          },
          child: ColorItem(
            color: colorList[index],
            isSelected: currentIndex == index,
          ),
        ),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isSelected});
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38 * 2,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent, width: 4),
        color: color,
      ),
    );
  }
}
