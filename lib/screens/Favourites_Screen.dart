import 'package:flutter/material.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/widgets/mealWidget.dart';


class Favourites extends StatelessWidget {

  final List<Meal> favMeal ;
  Favourites(this.favMeal);

  @override
  Widget build(BuildContext context) {

    if(favMeal.isEmpty) {
      return Scaffold(
        body: Center(child: Text("you have no fav , add some"),),
      );
    }else
      {
        return ListView.builder(
          itemCount: favMeal.length,
          itemBuilder: (_ , index) {
            return MealWidget(id: favMeal[index].id ,imageUrl: favMeal[index].imageUrl,
              title:favMeal[index].title , duration: favMeal[index].duration,
              affordability: favMeal[index].affordability, complexity: favMeal[index].complexity,);
          },);
      }
  }
}
