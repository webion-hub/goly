import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_button.dart';
import 'package:goly/components/settings/settings_switcher.dart';
import 'package:goly/models/category.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/utils/constants.dart';

class HandleCategoryPage extends StatelessWidget {
  static String routeName = "add-category";
  final CategoryModel? category;
  const HandleCategoryPage({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    TextEditingController categoryName =
        TextEditingController(text: category?.name ?? '');
    TextEditingController description =
        TextEditingController(text: category?.description ?? '');
    final formKey = GlobalKey<FormState>();
    void addCategory() async {
      CategoryModel c = CategoryModel(
          name: categoryName.text,
          private: false,
          description: description.text,
          goals: category?.goals);

      category == null
          ? CategoryService.addCategory(category: c)
          : CategoryService.editCategory(category: c);
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(category != null ? 'Edit category' : 'Add category')),
      body: Column(children: [
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
                    decoration: const InputDecoration(labelText: 'Description'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20.0),
                  SettingsSwitcher(
                      icon: Icons.lock,
                      text: "Make this category private",
                      subtitle: "And all the goals inside it",
                      onChanged: () {}),
                  const SizedBox(height: 20.0),
                  MainButton(
                      text: category != null ? 'Edit category' : 'Add category',
                      onPressed: addCategory),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
