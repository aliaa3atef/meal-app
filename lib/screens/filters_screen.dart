import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  final Function saveFilter ;
  final Map<String,bool>currentFilters;

  Filters( this.currentFilters ,this.saveFilter);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool glutenFree = false,
      vegan = false,
      vegetarian = false,
      lactoseFree = false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    glutenFree = widget.currentFilters['gluten'];
    vegan = widget.currentFilters['vegan'];
    vegetarian = widget.currentFilters['vegetarian'];
    lactoseFree = widget.currentFilters['lactose'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        backgroundColor: Colors.pinkAccent.withOpacity(.5),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust Your Meal Selection",
                style: TextStyle(fontSize: 25),
              )),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile("gluten free",
                    "contains gluten free meals only", glutenFree, (val) {
                  setState(() {
                    glutenFree = val;
                  });
                }),
                Divider(),
                buildSwitchListTile(
                    "vegan meals", "contains vegan meals only", vegan, (val) {
                  setState(() {
                    vegan = val;
                  });
                }),
                Divider(),
                buildSwitchListTile(
                    "vegetarian", "contains vegetarian meals only", vegetarian,
                    (val) {
                  setState(() {
                    vegetarian = val;
                  });
                }),
                Divider(),
                buildSwitchListTile("lactose Free",
                    "contains lactose Free meals only", lactoseFree, (val) {
                  setState(() {
                    lactoseFree = val;
                  });
                }),
                Container(
                    height: 80,
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      color: Colors.pinkAccent.withOpacity(.5),
                      onPressed: (){
                        final selectedFilters = {
                              'gluten':glutenFree,
                              'lactose':lactoseFree,
                              'vegan':vegan,
                              'vegetarian' : vegetarian,
                              };
                        widget.saveFilter(selectedFilters);
                        },
                        child: Text(
                      "Save" , style: TextStyle(fontSize: 20 , color: Colors.white),),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      String txt, String hint, bool currentVal, Function update) {
    return SwitchListTile(
      activeColor: Colors.pinkAccent,
      title: Text(
        txt,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(hint, style: TextStyle(fontSize: 16)),
      value: currentVal,
      onChanged: update,
    );
  }
}
