import 'package:goly/models/category.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/models/step.dart';

class DummyData {
  static List<CategoryModel> categories = [
    CategoryModel(
        name: "Work",
        private: true,
        description: "test description",
        goals: [
          GoalModel(
              id: '1',
              title: 'Earn 20k',
              private: false,
              privateDescription: false,
              steps: [
                StepModel(
                  private: false,
                  title: "Make 10k",
                  completed: false,
                  description: "Make 10k",
                ),
                StepModel(
                  private: false,
                  title: "Make other 10k",
                  completed: false,
                  description: "Make other 10k",
                ),
              ]),
          GoalModel(
              id: '2',
              title: 'Earn 50k',
              private: false,
              privateDescription: false),
        ]),
    CategoryModel(
        name: "University",
        private: true,
        description: "test description",
        goals: [
          GoalModel(
            id: '1',
            title: 'Pass OLI',
            private: false,
            privateDescription: false,
          ),
        ]),
  ];
}
