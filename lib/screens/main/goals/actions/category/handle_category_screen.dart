import 'package:flutter/material.dart';
import 'package:goly/widgets/form/buttons/main_button.dart';
import 'package:goly/widgets/settings/settings_switcher_list_tile.dart';
import 'package:goly/models/category.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/utils/constants.dart';
import 'package:uuid/uuid.dart';

class HandleCategoryScreen extends StatefulWidget {
  static String routeNameEdit = "/handle-category";
  static String routeNameAdd = "/add-category";
  final CategoryModel? category;
  const HandleCategoryScreen({super.key, this.category});

  @override
  State<HandleCategoryScreen> createState() => _HandleCategoryScreenState();
}

class _HandleCategoryScreenState extends State<HandleCategoryScreen> {
  late bool privateCategory = widget.category?.private ?? false;
  late bool privateDescription = widget.category?.privateDescription ?? false;

  late TextEditingController categoryName =
      TextEditingController(text: widget.category?.name ?? '');

  late TextEditingController description =
      TextEditingController(text: widget.category?.description ?? '');

  void privateCategoryChange(bool value) {
    setState(() {
      privateCategory = value;
    });
  }

  void privateDescriptionChange(bool value) {
    setState(() {
      privateDescription = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    void handleCategory() async {
      CategoryModel c = CategoryModel(
          id: widget.category?.id ?? const Uuid().v1(),
          name: categoryName.text,
          private: privateCategory,
          description: description.text,
          privateDescription: privateDescription);

      widget.category == null
          ? CategoryService.addCategory(category: c)
          : CategoryService.editCategory(category: c);
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
          title:
              Text(widget.category != null ? 'Edit category' : 'Add category')),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
              padding: Constants.pagePadding,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: categoryName,
                      decoration: const InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: description,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 20.0),
                    SettingsSwitcherListTile(
                        initialValue: privateCategory,
                        icon: Icons.lock,
                        text: "Private category",
                        subtitle: "Makes private all the goals inside it",
                        onChanged: privateCategoryChange),
                    const SizedBox(height: 20.0),
                    SettingsSwitcherListTile(
                        initialValue: privateDescription,
                        icon: Icons.lock,
                        text: "Private description",
                        subtitle: "Makes private description",
                        onChanged: privateDescriptionChange),
                    const SizedBox(height: 20.0),
                    MainButton(
                      text: widget.category != null
                          ? 'Update category'
                          : 'Add category',
                      onPressed: handleCategory,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
