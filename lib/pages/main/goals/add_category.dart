import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_button.dart';
import 'package:goly/models/category.dart';
import 'package:goly/utils/constants.dart';

class AddCategoryPage extends StatelessWidget {
  static String routeName = "add-category";
  const AddCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController categoryName = TextEditingController(text: '');
    TextEditingController description = TextEditingController(text: '');
    final formKey = GlobalKey<FormState>();
    void addCategory() {
      //CategoryModel c = CategoryModel(name: name, private: private, description: description)
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Add category')),
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
                MainButton(text: "Add category", onPressed: addCategory),
              ],
            ),
          ),
        ),
      ),
      ]),
    );
  }
}
