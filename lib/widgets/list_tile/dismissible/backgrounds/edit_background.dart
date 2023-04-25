import 'package:flutter/material.dart';

class EditBackground extends StatelessWidget {
  const EditBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).highlightColor,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
