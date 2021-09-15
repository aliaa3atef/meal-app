import 'package:flutter/material.dart';
import 'package:meal_application/models/meal.dart';

class MealWidget extends StatelessWidget {
  final String title, imageUrl , id;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;

  const MealWidget({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
  });

  String get complexity_text{
    switch(complexity)
    {
      case Complexity.Challenging : return "Challenging" ; break;
      case Complexity.Hard : return "Hard" ; break;
      case Complexity.Simple : return "Simple" ; break;
      default : return "Unknown" ; break;
    }
  }

  String get afford{
    switch(affordability)
    {
      case Affordability.Affordable : return "Affordable" ; break;
      case Affordability.Luxurious : return "Luxurious" ; break;
      case Affordability.Pricey : return "Pricey" ; break;
      default : return "Unknown" ; break;
    }
  }
  void detailsFun(BuildContext context){
    Navigator.of(context).pushNamed('/d', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> detailsFun(context),
      child: Card(
        elevation: 20,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15) , topRight: Radius.circular(15),
                  ),
                  child:  Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 200,
                    color: Colors.black45,
                    padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowData(Icons.access_time , "$duration min"),

                buildRowData(Icons.shopping_bag_outlined , complexity_text),

                buildRowData(Icons.attach_money , afford),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRowData(IconData icon , String title ) {
    return Row(
            children: [
              Icon(icon),
              Text(title),
            ],
          );
  }
}
