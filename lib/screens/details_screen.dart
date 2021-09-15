import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';
import 'package:meal_application/widgets/show_details.dart';

class Details extends StatelessWidget {

  final Function fav , isFav;
  Details(this.fav, this.isFav);

  @override
  Widget build(BuildContext context) {
    var mealID = ModalRoute.of(context).settings.arguments as String;
    var detailsData = DUMMY_MEALS.firstWhere((element) => element.id == mealID);


    return Scaffold(
      appBar: AppBar(
        title: Text(detailsData.title),
        backgroundColor: Colors.pinkAccent.withOpacity(.5),
      ),
      body: ShowDetails(detailsData),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent.withOpacity(.5),
        child: (isFav(mealID))?Icon(Icons.favorite ,color: Colors.black,) : Icon(Icons.favorite ,) ,
        onPressed: (){fav(mealID);},

      ),
    );
  }


}
