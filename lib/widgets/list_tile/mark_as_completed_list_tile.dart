import 'package:flutter/material.dart';

class MarkAsCompletedListTile extends StatefulWidget {
  const MarkAsCompletedListTile({super.key});

  @override
  State<MarkAsCompletedListTile> createState() =>
      _MarkAsCompletedListTileState();
}

class _MarkAsCompletedListTileState extends State<MarkAsCompletedListTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: CheckboxListTile(
        onChanged: (value) {},
        value: false,
        title: const Text('Mark this goal as completed'),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
