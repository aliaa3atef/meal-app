import 'package:flutter/material.dart';

class ShowDetails extends StatelessWidget {

  final detailsData;
  ShowDetails(this.detailsData);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            child: Image.network(
              detailsData.imageUrl,
              fit: BoxFit.cover,
              height: 300,
            ),
            borderRadius: BorderRadius.circular(20),
          ),

          SizedBox(
            height: 30,
          ),

          buildButtons("Ingredients", () {
            buildIngredients(context);
          }),

          buildButtons("Steps" , (){
            buildSteps(context);
          }),
        ],
      ),
    );
  }

  Future buildSteps(BuildContext context) {
    return showModalBottomSheet(
            context: context,
            builder: (_) {
              return ListView.builder(
                itemCount: detailsData.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.pinkAccent.withOpacity(.5),
                          child: Text("#${index+1}" , style: TextStyle(fontSize: 18,
                            color: Colors.black,
                          ),),
                        ),

                        title: Text(detailsData.steps[index] , style: TextStyle(
                          fontSize: 23,
                        ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Divider(color: Colors.pinkAccent.withOpacity(.5) , ),
                    ],
                  );
                },
              );
            },
          );
  }

  Future buildIngredients(BuildContext context) {
    return showModalBottomSheet(
            backgroundColor: Colors.pinkAccent.withOpacity(.3),
            context: context,
            builder: (_) {
              return ListView.builder(
                itemCount: detailsData.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Card(
                        elevation: 20,
                        shadowColor: Colors.black,
                        color: Colors.white,
                        child: Text(detailsData.ingredients[index] , style: TextStyle(
                          fontSize: 25,

                        ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
  }
}

Container buildButtons(String text, Function fun) {
  return Container(
    padding: EdgeInsets.all(20),
    height: 90,
    width: double.infinity,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: ElevatedButton(
          onPressed: fun,
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.pinkAccent.withOpacity(.5),
          )),
    ),
  );
}
