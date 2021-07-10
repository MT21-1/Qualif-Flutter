import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:qualif/views/pages/ListPage.dart';
import 'package:qualif/views/pages/LoginPage.dart';
import 'package:qualif/utils/globals.dart' as globals;

class HomePage extends StatefulWidget{
  String email;
  HomePage(this.email);
  @override
  State<StatefulWidget> createState() {
    return HomePageState(email);
  }
  

}

class HomePageState extends State<HomePage>{
  String email;
  HomePageState(this.email);
  
  var carouselImages = [
    'assets/carousel-1.png',
    'assets/carousel-2.jpg',
    'assets/carousel-3.jpg'
  ];

  void logout(BuildContext ctx){
    Navigator.push(ctx, MaterialPageRoute(builder: (ctx){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: globals.darkTheme ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          body:LoginPage()
        ),
      );
    }));
  }

  void openList(BuildContext ctx){
    Navigator.push(ctx, MaterialPageRoute(builder: (ctx){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: globals.darkTheme ? ThemeData.dark() : ThemeData.light(),
        
        home: Scaffold(
          appBar: AppBar(title: Text("Dota 2 Item List"),),
          body: ListPage()
        ),
      );
      
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: globals.darkTheme ?ThemeData.dark() : ThemeData.light(),
      home:Scaffold(
        
        body: Column(
              children: [
                CarouselSlider(
                      items:[
                        Image(image: AssetImage(carouselImages[0])),
                        Image(image: AssetImage(carouselImages[1])),
                        Image(image: AssetImage(carouselImages[2])),
                      ],
                      options: CarouselOptions(
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2)
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ConstrainedBox(constraints: BoxConstraints(minHeight: 200, maxHeight: 200, minWidth: 300, maxWidth: 340),
                          child: Image(image: AssetImage('assets/logo.png'), fit: BoxFit.contain,),),
                          Text("Dota 2 Shop, specializes on selling Dota 2 Items with the best price for Dota 2 Players, People can Also Comment Their thoughts and Reviews About a Specific item in this app.", textAlign: TextAlign.justify,)
                        ],
                      ),
                      margin: EdgeInsets.all(40),
                    )
                    
              ],
            ),
            
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
                return ['Toggle'].map((e) {
                  return PopupMenuItem(
                    child: TextButton(
                      child: Text('Switch Theme'),
                      onPressed: () {
                        setState(() {
                          globals.darkTheme = !globals.darkTheme;
                        });
                      },
                    ));
                }).toList();
              })
          ],
          ),
        drawer: Drawer(
          child: ListView(
            children: [
              Text('Welcome ${email}', textScaleFactor: 2,),
              ListTile(
                title: TextButton(
                  child: Text("Item List", textScaleFactor: 1.5,),
                  // ntar onpressed buka ListPage.
                  onPressed: () => openList(context),
                  ),
              ),
              ListTile(
                title: TextButton(
                  child: Text("Logout", textScaleFactor: 1.5,),
                  onPressed: () => logout(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    
  }
}