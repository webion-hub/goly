import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;
  const UserImagePicker({super.key, required this.imagePickFn});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? pickedImage;

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? img = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
    );

    if (img != null) {
      setState(() {
        // ignore: unnecessary_cast
        pickedImage = File(img.path);
      });

      if (pickedImage != null) {
        widget.imagePickFn(pickedImage!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Theme.of(context).hoverColor,
          backgroundImage: pickedImage != null ? FileImage(pickedImage!) : null,
        ),
        const SizedBox(height: 10.0),
        OutlinedButton.icon(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: Text(pickedImage != null ? 'Change image' : 'Add image'),
        ),
      ],
    );
  }
}
