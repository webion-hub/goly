import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goly/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;
  final String? imagePath;
  const UserImagePicker({super.key, required this.imagePickFn, this.imagePath});

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
        pickedImage = File(img.path);
      });

      if (pickedImage != null) {
        widget.imagePickFn(pickedImage!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> img;
    if (pickedImage != null) {
      img = FileImage(pickedImage!);
    } else if (widget.imagePath != null) {
      img = Image.network(widget.imagePath!).image;
    } else {
      img = Image.network(Constants.userImageDefault).image;
    }
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Theme.of(context).hoverColor,
          backgroundImage: img,
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
