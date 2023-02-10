import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_button.dart';
import 'package:goly/models/category.dart';
import 'package:goly/utils/constants.dart';

class HandleCategoryPage extends StatelessWidget {
  static String routeName = "add-category";
  final CategoryModel? category;
  const HandleCategoryPage({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    TextEditingController categoryName = TextEditingController(text: category?.name ?? '');
    TextEditingController description = TextEditingController(text: category?.description ?? '');
    final formKey = GlobalKey<FormState>();
    void addCategory() {
      CategoryModel c = CategoryModel(name: categoryName.text, private: false, description: description.text);
      print(c.toJson());

      //FirebaseFirestore.instance.collection('users').doc(Utils.currentUid()).set();

    }
    return Scaffold(
      appBar: AppBar(title: Text(category !=null ? 'Edit category' : 'Add category')),
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
                MainButton(text: category !=null ? 'Edit category' : 'Add category', onPressed: addCategory),
              ],
            ),
          ),
        ),
      ),
      ]),
    );
  }
}
