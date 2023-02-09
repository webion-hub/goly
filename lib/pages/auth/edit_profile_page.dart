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

class EditProfilePage extends StatelessWidget {
  static String routeName = '/edit-profile';
  String? imageUrl;
  final String uid;
  final UserModel? user;

  EditProfilePage({super.key, required this.uid, this.user});



  final formKey = GlobalKey<FormState>();

  void _pickedImage(File image) {

    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child('$uid${p.extension(image.path)}');
    
    ref.putFile(image)
        .whenComplete(() async => imageUrl = await ref.getDownloadURL());
  }

  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController(text: user?.username ?? '');
    var bioController = TextEditingController(text:user?.bio ?? '');
    String? errorMessage;
    void setUp() {
      final isValid = formKey.currentState!.validate();
      if (!isValid) {
        return;
      }

      FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({
          'username': usernameController.text,
          'email': Utils.currentEmail().trim(),
          'photoUrl': imageUrl ?? '',
          'bio': bioController.text,
          'id': Utils.currentUid(),
        });

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      appBar: AppBar(title: Text(user!= null ? 'Edit profile' : 'Set up profile')),
      body: Center(
        child: Container(
          padding: Constants.pagePadding,
          child: Form(
            key: formKey,
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user!= null ? 'Edit user information' : 'Set up the profile information',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20.0),
                    UserImagePicker(
                      imagePickFn: _pickedImage,
                      imagePath: user?.photoUrl,
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
