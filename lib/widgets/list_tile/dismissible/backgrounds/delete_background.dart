import 'package:flutter/material.dart';

class DeleteBackground extends StatelessWidget {
  const DeleteBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).errorColor,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}