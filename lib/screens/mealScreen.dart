import 'package:flutter/material.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/widgets/mealWidget.dart';

class MealScreen extends StatelessWidget {
  final List<Meal> availableMeal;

  MealScreen(this.availableMeal);


  @override
  Widget build(BuildContext context) {
    final routeArg =
    ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, Object>;
    final routeID = routeArg['id'];
    final mealsData = availableMeal.where((element) =>
        element.categories.contains(routeID)).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(routeArg['title']),
          backgroundColor: Colors.pinkAccent.withOpacity(.5),
        ),
        body: ListView.builder(
          itemCount: mealsData.length,
          itemBuilder: (_ , index) {
          return MealWidget(id: mealsData[index].id ,imageUrl: mealsData[index].imageUrl,
            title:mealsData[index].title , duration: mealsData[index].duration,
          affordability: mealsData[index].affordability, complexity: mealsData[index].complexity,);
        },)

    );
  }
}
