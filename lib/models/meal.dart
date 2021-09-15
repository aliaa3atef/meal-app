import 'package:flutter/material.dart';

enum Affordability { Affordable, Pricey, Luxurious }

enum Complexity { Simple, Challenging, Hard }

class Meal {
  final String id, title, imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final List<String> ingredients, steps, categories;
  final bool isGlutenFree, isVegan, isVegetarian, isLactoseFree;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.ingredients,
    @required this.steps,
    @required this.categories,
    @required this.isGlutenFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isLactoseFree,
  });
}
