import 'dart:io';
import 'package:goly/models/user.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/utils/validators.dart';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_button.dart';
import 'package:goly/components/pickers/user_image_picker.dart';
import 'package:goly/main.dart';
import 'package:goly/utils/constants.dart';

class HandleProfilePage extends StatefulWidget {
  static String routeName = '/handle-profile';

  final String uid;
  final UserModel? user;

  const HandleProfilePage({super.key, required this.uid, this.user});

  @override
  State<HandleProfilePage> createState() => _HandleProfilePageState();
}

class _HandleProfilePageState extends State<HandleProfilePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? imageUrl;
    void pickedImage(File image) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('user_image')
          .child('${widget.uid}${p.extension(image.path)}');

      ref
          .putFile(image)
          .whenComplete(() async => imageUrl = await ref.getDownloadURL());
    }

    var usernameController =
        TextEditingController(text: widget.user?.username ?? '');
    var bioController = TextEditingController(text: widget.user?.bio ?? '');

    String? errorMessage;
    void setUp() {
      final isValid = formKey.currentState!.validate();
      if (!isValid) {
        return;
      }

      FirebaseFirestore.instance.collection('users').doc(widget.uid).set({
        'username': usernameController.text,
        'email': Utils.currentEmail().trim(),
        'photoUrl': imageUrl ?? Constants.userImageDefault,
        'bio': bioController.text,
        'id': Utils.currentUid(),
      });

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.user != null ? 'Edit profile' : 'Set up profile',
        ),
      ),
      body: Center(
        child: Container(
          padding: Constants.pagePadding,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.user != null
                      ? 'Edit user information'
                      : 'Set up your profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20.0),
                UserImagePicker(
                  imagePickFn: pickedImage,
                  imagePath: widget.user?.photoUrl,
                ),
                TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: (username) {
                      errorMessage = Validations.validateUsername(username);
                      if (username != null && errorMessage != null) {
                        return errorMessage;
                      }
                      return null;
                    }),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: bioController,
                  decoration: const InputDecoration(labelText: 'Bio'),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),
                const SizedBox(height: 20.0),
                MainButton(text: "Set up", onPressed: setUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
