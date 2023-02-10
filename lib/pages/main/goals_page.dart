import 'package:flutter/material.dart';
import 'package:goly/components/app_bars/goals_app_bar.dart';
import 'package:goly/components/cards/action_card.dart';
import 'package:goly/components/cards/category_card.dart';
import 'package:goly/components/statistics/goals_per_life_area.dart';
import 'package:goly/models/category.dart';
import 'package:goly/models/dummy_data.dart';
import 'package:goly/pages/main/goals/handle_category_page.dart';
import 'package:goly/utils/constants.dart';

class GoalsPage extends StatefulWidget {
  static const routeName = '/goals';
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _MainPageState();
}

class _MainPageState extends State<GoalsPage> {
  void addCategory() {
    Navigator.of(context).pushNamed(HandleCategoryPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var categories = DummyData.categories;
    return Scaffold(
        appBar: const GoalsAppBar(),
        body: SingleChildScrollView(
          padding: Constants.pagePadding,
          child: Column(
            children: [
              const Text('Life areas'),
               ...categories.map((category) => CategoryCard(category: category)),
              ActionCard(
                  text: "Add category", icon: Icons.add, action: addCategory),
              const SizedBox(
                height: 40,
              ),
              const Text('Statistics'),
              const GoalsPerLifeArea(),
            ],
          ),
        ));
  }
}
