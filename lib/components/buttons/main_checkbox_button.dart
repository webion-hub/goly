import 'package:flutter/material.dart';

class MainCheckboxButton extends StatefulWidget {
  const MainCheckboxButton({super.key});

  @override
  State<MainCheckboxButton> createState() => _MainCheckboxButtonState();
}

class _MainCheckboxButtonState extends State<MainCheckboxButton> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Theme.of(context).primaryColor;
      }
      return Theme.of(context).secondaryHeaderColor;
    }

    return Checkbox(
      checkColor: Theme.of(context).primaryColor,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}