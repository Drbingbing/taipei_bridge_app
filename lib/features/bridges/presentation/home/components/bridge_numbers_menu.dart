import 'package:flutter/material.dart';

class BirdgeNumbersMenu extends StatelessWidget {
  final List<int> numbers;
  final int initialValue;
  final void Function(int) onTap;

  const BirdgeNumbersMenu(
      {super.key,
      required this.numbers,
      required this.initialValue,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: initialValue,
      onSelected: (value) {
        onTap(value);
      },
      itemBuilder: (context) {
        return numbers.map((number) {
          return PopupMenuItem(
            value: number,
            child: Text('$number'),
          );
        }).toList();
      },
      child: Material(
        elevation: 0.5,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
          child: Text(
            '$initialValue',
            style: const TextStyle(
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
