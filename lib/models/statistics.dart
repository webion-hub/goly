class GoalsPerLifeAreaModel {
  GoalsPerLifeAreaModel({required this.category, required this.goalsNumber});
  final String category;
  final int goalsNumber;
}

class LifeAreaProgressModel {
  LifeAreaProgressModel({required this.category, required this.percentageOfCompletition});
  final String category;
  final double percentageOfCompletition;
}
