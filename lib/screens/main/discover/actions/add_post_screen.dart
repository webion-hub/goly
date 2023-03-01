import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/providers/user_provider.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';
import 'package:goly/services/post_service.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/form/buttons/main_button.dart';
import 'package:goly/widgets/form/input/text_field_input.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  static const String routeName = "/add-post";
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _goal = TextEditingController();

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await Utils.pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await Utils.pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void postImage(String uid, String username, String profImage) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await PostService.uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        Utils.showSnackbBar(
          'Posted!',
        );
        clearImage();
        
      } else {
        Utils.showSnackbBar(res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      Utils.showSnackbBar(err.toString());
    }
    finally {
      GoRouter.of(context).go(DiscoverScreen.routeName);
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
    _goal.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    var imageContainer = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        height: 200,
        width: 200,
        child: _file != null
            ? AspectRatio(
                aspectRatio: 487 / 451,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    alignment: FractionalOffset.topCenter,
                    image: MemoryImage(_file!),
                  )),
                ),
              )
            : Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.upload,
                  ),
                  onPressed: () => _selectImage(context),
                ),
              ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post to'),
      ),
      // POST FORM
      body: isLoading
          ? customBuffering()
          : SingleChildScrollView(
              padding: Constants.pagePadding,
              child: Column(
                children: [
                  imageContainer,
                  const SizedBox(height: 10),
                  TextFieldInput(
                    textEditingController: _descriptionController,
                    hintText: 'Write a caption',
                    textInputType: TextInputType.text,
                    label: 'Caption',
                  ),
                  TextFieldInput(
                    textEditingController: _goal,
                    hintText: 'Which goal is it about?',
                    textInputType: TextInputType.text,
                    label: 'Goal',
                  ),
                  const SizedBox(height: 10),
                  MainButton(
                    text: 'Post',
                    onPressed: () => postImage(
                      userProvider.getUser.id,
                      userProvider.getUser.username,
                      userProvider.getUser.photoUrl,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
