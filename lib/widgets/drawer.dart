import 'package:flutter/material.dart';
import 'package:meal_application/screens/categories_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, top: 30),
            width: double.infinity,
            height: 100,
            color: Colors.pinkAccent.withOpacity(.5),
            child: Text("Cooking Up!",
              style: TextStyle(fontSize: 35, color: Colors.white),),
          ),

          buildListTile(Icon(Icons.restaurant), "Meals", (){Navigator.of(context).pushNamed('/');}),

          SizedBox(height: 20,),

          buildListTile(
              Icon(Icons.settings), "Filters",(){Navigator.of(context).pushNamed('/f');}),
        ],
      ),
    );
  }

  ListTile buildListTile(Icon icon, String text, Function tap) {
    return ListTile(
      leading: icon,
      title: Text(text, style: TextStyle(fontSize: 22),),
      onTap: tap,
    );
  }

}
