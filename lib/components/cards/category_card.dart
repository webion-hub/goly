import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/models/category.dart';
import 'package:goly/pages/main/goals/category_page.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dismissible(
        key: ValueKey(title),
        background: Container(
          color: Theme.of(context).errorColor,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 20,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text(
                'Do you want to remove this category and all the goals inside it?',
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                ),
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                ),
              ],
            ),
          );
        },
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => CategoryPage(
              category: CategoryModel(
                name: "Work life balance",
                private: false,
              ),
            ),
          )),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title),
                    const Text('Progress: 80%'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
