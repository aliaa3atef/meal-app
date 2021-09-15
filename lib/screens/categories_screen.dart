import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';
import 'package:meal_application/widgets/categories_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
          padding: EdgeInsets.all(20),
          children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.title , e.id)).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 50,
            crossAxisSpacing: 50,
            childAspectRatio: 3 / 2,
          )),
    );
  }
}
