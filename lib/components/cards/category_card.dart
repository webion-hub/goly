import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/pages/main/goals/category_page.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
                 onTap: () => Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => const CategoryPage(
              categoryName: 'Work',
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
    );
  }
}
