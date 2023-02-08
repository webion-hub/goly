import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
        ),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.image),
            label: const Text('Add image'),
          ),
      ],
    );
  }
}
