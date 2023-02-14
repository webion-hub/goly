import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/models/category.dart';
import 'package:goly/pages/main/goals/category_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dismissible(
        key: ValueKey(category.name),
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
        child: ListTile(
          title: Text(category.name),
          onTap: (() => Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => CategoryPage(
                    category: category,
                  ),
                ),
              )),
          leading: const Icon(Icons.open_in_new),
          subtitle:
              category.description != null ? Text(category.description!) : null,
          trailing: FittedBox(
            child: CircularPercentIndicator(
              radius: 16.0,
              lineWidth: 4.0,
              percent: 0.4,
              progressColor: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
