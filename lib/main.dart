import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/screens/categories_screen.dart';
import 'package:meal_application/screens/details_screen.dart';
import 'package:meal_application/screens/filters_screen.dart';
import 'package:meal_application/screens/mealScreen.dart';
import 'package:meal_application/widgets/drawer.dart';

import 'screens/Favourites_Screen.dart';

void main(){runApp(Meal_App());}

class Meal_App extends StatefulWidget{
  @override
  _Meal_AppState createState() => _Meal_AppState();
}

List<Meal> favMeals = [] ;
List<Meal> availableMeal = DUMMY_MEALS;
Map<String , bool> filters ={
  'gluten':false,
  'lactose':false,
  'vegan':false,
  'vegetarian' : false,
};

class _Meal_AppState extends State<Meal_App> {


  void setFilters(Map<String , bool> filterData){
    setState(() {
      filters = filterData;
      availableMeal  = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;

        if (filters['lactose'] && !meal.isLactoseFree) return false;

        if (filters['vegan'] && !meal.isVegan) return false;

        if (filters['vegetarian'] && !meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }

void fav(mealID){
    final existingIndex = favMeals.indexWhere((meal) => meal.id==mealID);

    if(existingIndex>=0) setState(() {
      favMeals.removeAt(existingIndex);
    });
    else {
      setState(() {
        favMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealID ) );
      });
    }
  }

  bool isFav(String mealId){
    return favMeals.any((element) => element.id==mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/f':(ctx)=>Filters(filters , setFilters),
        '/m' : (ctx)=> MealScreen(availableMeal),
        '/d' : (ctx)=> Details(fav, isFav),
        '/fav' : (ctx)=> Favourites(favMeals),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottom_index=0;
  List pages = [{
    'page':  Categories(),
    'title': "Categories",
  } ,
    {
      'page': Favourites(favMeals),
      'title': "Favourites",
    },
  ];

  void bottomTap(index){
    setState(() {
      bottom_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pages[bottom_index]['title'] ,
          ),
          backgroundColor: Colors.pinkAccent.withOpacity(.5),
        ),
        body: pages[bottom_index]['page'],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category) , label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.star) , label: "Favourites"),
          ],
          onTap: bottomTap,
          backgroundColor: Colors.pinkAccent.withOpacity(.5),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          currentIndex: bottom_index,
          selectedFontSize: 16,

        ),
        drawer: MainDrawer(),
      ),
    );
  }
}


