import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/introductions/explenation_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:path/path.dart' as p;
import 'package:goly/models/user.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/utils/validators.dart';
import 'package:goly/widgets/form/input/input_label.dart';
import 'package:goly/widgets/form/input/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:goly/widgets/form/buttons/main_button.dart';
import 'package:goly/widgets/pickers/user_image_picker.dart';
import 'package:goly/utils/constants.dart';

class HandleProfileScreen extends StatefulWidget {
  static const routeNameSetUp = '/set-up-profile';
  static const routeNameEdit = '/edit-profile';
  final String uid;
  final UserModel? user;

  const HandleProfileScreen({super.key, required this.uid, this.user});

  @override
  State<HandleProfileScreen> createState() => _HandleProfileScreenState();
}

class _HandleProfileScreenState extends State<HandleProfileScreen> {
  bool isLoading = false;
  late String? imageUrl = widget.user?.photoUrl;
  final formKey = GlobalKey<FormState>();
  late final _usernameController =
      TextEditingController(text: widget.user?.username ?? '');
  late final _bioController =
      TextEditingController(text: widget.user?.bio ?? '');
  String? errorMessage;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

  void pickedImage(File image) {
    setState(() {
      isLoading = true;
    });

    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child('${widget.uid}${p.extension(image.path)}');

    ref.putFile(image).then((p0) {
      ref.getDownloadURL().then((value) {
        imageUrl = value.toString();
      });
    }).onError((error, stackTrace) {
      Utils.showSnackbBar(
          'An error has occurred uploading the image. Please try again');
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  void setUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    var router = GoRouter.of(context);
    try {
      await UserService.updateProfile(
        user: UserModel(
          username: _usernameController.text,
          bio: _bioController.text,
          following: widget.user == null ? [] : widget.user!.following,
          followers: widget.user == null ? [] : widget.user!.followers,
          email: Utils.currentEmail().trim(),
          photoUrl: imageUrl ?? Constants.userImageDefault,
          id: Utils.currentUid(),
        ),
      );
      if (widget.user == null) {
        await CategoryService.setDefaultCategories();
        router.go(ExplenationScreen.routeName);
      } else {
        router.go(ProfileScreen.routeName);
      }
    } catch (e) {
      Utils.showSnackbBar(
          'An error has occurred updating your profile. Please try again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.user != null ? 'Edit profile' : 'Set up profile',
        ),
      ),
      body: SingleChildScrollView(
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
                  imagePath:
                      widget.user?.photoUrl ?? Constants.userImageDefault,
                ),
                const SizedBox(height: 20.0),
                const InputLabel(
                  text: 'Username',
                ),
                const SizedBox(height: 10.0),
                TextFieldInput(
                    textEditingController: _usernameController,
                    hintText: 'Username',
                    textInputType: TextInputType.text,
                    validation: Validations.validateUsername),
                const SizedBox(height: 20.0),
                const InputLabel(
                  text: 'Bio',
                ),
                const SizedBox(height: 10.0),
                TextFieldInput(
                  textEditingController: _bioController,
                  hintText: 'Bio',
                  textInputType: TextInputType.multiline,
                  validation: Validations.validateBio,
                  maxLines: 3,
                ),
                const SizedBox(height: 20.0),
                isLoading
                    ? buffering()
                    : MainButton(text: "Set up", onPressed: setUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
