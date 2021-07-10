import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualif/models/Review.dart';
import 'package:qualif/utils/globals.dart' as globals;

class DetailPage extends StatefulWidget{
  String img;
  String name;
  String description;
  String price;
  DetailPage(this.img, this.name, this.description, this.price);
  @override
  State<StatefulWidget> createState() {
    return DetailPageState(img, name, description, price);
  }

}

class DetailPageState extends State<DetailPage>{
  String img;
  String name;
  String description;
  String price;
  dynamic list = [];

  DetailPageState(this.img, this.name, this.description, this.price);
  var ctrlReview = TextEditingController();

  Widget reviewBuilder(Review r){
    return Card(
      child: ListTile(
        title: Text(r.email),
        trailing: Text(r.review)
      )
    );
  }

  void submitReview(BuildContext ctx){
    if(ctrlReview.text == ""){
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text('Review Cannot Be Empty'))
      );
    }else{
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text('Review Posted'))
      );
      setState(() {
        var r = Review(ctrlReview.text, globals.email);
        list.add(r);
      });
      print(list.length);
    }
  }

  

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('${name}'),
          bottom: TabBar(
            tabs:[
              Tab(icon: Icon(Icons.info)),
              Tab(icon: Icon(Icons.star))
            ],
          ),
        ),
        body: 
          TabBarView(
            children: [
              Center(
                child: 
                Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 220,
                        minHeight: 200,
                        maxWidth: 260,
                        minWidth: 240
                      ),
                      child: Image(image: AssetImage('assets/${img}'), fit: BoxFit.cover,) ,
                    ),
                    Text(name, textScaleFactor: 1.8,),
                    Text(price, textScaleFactor: 1.3,),
                    Container(
                      child: Text(description, textScaleFactor: 1.1, textAlign: TextAlign.justify,),
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Reviews'),
                        controller: ctrlReview,
                      ),
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    ),
                    ElevatedButton(onPressed: ()=>submitReview(context), child: Text("Post"))
                    
                  ],
                ),
              ),
              ListView(
                children: 
                  list.map<Widget>((e) => reviewBuilder(e)).toList()
              )
            ],
          ), 
      )
    );
  }
    
}