import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/category.dart';
import 'package:goly/models/statistics.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/utils/utils.dart';

class StatisticService extends Service {
  static Future getGoalsPerLifeArea() async {
    List<GoalsPerLifeAreaModel> categoriesData = [];
    return await FirebaseFirestore.instance
        .collection('goals')
        .doc(Utils.currentUid())
        .collection('categories')
        .get()
        .then((categories) async {
      final futures = categories.docs.map((e) async {
        var category = CategoryModel.fromJson(e.data());
        var numberOfGoals = await CategoryService.getNumberofGoals(categoryId: category.id);
        categoriesData.add(GoalsPerLifeAreaModel(
          category: category.name,
          goalsNumber: numberOfGoals,
        ));
      });
      await Future.wait(futures);
      return categoriesData;
    });
  }

  static Future getLifeAreaProgress() async {
    List<LifeAreaProgressModel> categoriesData = [];
    return await FirebaseFirestore.instance
        .collection('goals')
        .doc(Utils.currentUid())
        .collection('categories')
        .get()
        .then((categories) async {
      final futures = categories.docs.map((e) async {
        var category = CategoryModel.fromJson(e.data());
        var percentageOfCompletition = await CategoryService.getPercentageOfCompletition(category);
        categoriesData.add(LifeAreaProgressModel(
          category: category.name,
          percentageOfCompletition: double.parse((percentageOfCompletition).toStringAsFixed(2)) * 100,
        ));
      });
      await Future.wait(futures);
      return categoriesData;
    });
  }
}
