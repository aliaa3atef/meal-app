import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final title, id;

  const CategoryItem(this.title, this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pinkAccent.withOpacity(.5), width: 5),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/m', arguments: {
            'title': title,
            'id': id,
          });
        },
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 22 ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
