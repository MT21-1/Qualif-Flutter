import 'package:flutter/material.dart';
import 'package:qualif/models/Location.dart';
import 'package:qualif/views/pages/DetailPage.dart';

class ListPage extends StatelessWidget{
  var _ctx = null;
  var _data = [
    Item('item-1.jpg', 'Feast Of Abscession', "Centuries ago, the Rumusque priestess Crella forged unbreakable links of hook and chain to bind the most powerful servants of the Dead God. But the Dead God's corruption grew too strong even for Crella's revered enchantments. Taken up with the rhythm of the Dirge, turning instead to carry out the destruction of Crella's homeland at the Dead God's command.", "330\$"),
    Item('item-2.jpg', 'Manifold Paradox', "With a raspy cackle, the elder smith Craler swung the sword that his family had spent eleven generations to fold and forge. So sharp it was that, with a sound like tearing fabric, a rip in reality tore open. Through this rip, Craler recognized himself from moments before, holding aloft the very same coveted blade.", "110\$"),
    Item('item-3.jpg', 'Bladeform Legacy', "Yurnero’s mask has been cleaved in two, awakening the ancient souls that once laid dormant inside it. These spirits have become one with Yurnero, giving him both the wisdom and fury of his ancestors. This symbiotic relationship has transformed the Juggernaut into something new and terrifying... a celestial force of nature.", "220\$"),
    Item('item-4.png', 'BattlePass TI10', "The Nemestice 2021 Battle Pass is a seasonal pass and features bundle made for Spring season. It contains numerous quests, achievements, and earnable rewards for its owner.", "11\$")
  ];

  void checkDetails(Item l){
    Navigator.push(_ctx, MaterialPageRoute(builder: (builder){
        return DetailPage(l.img, l.name, l.description, l.price);
      })
    );
  }

  Widget widgetBuilder(Item l){
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 60,
            minWidth: 60,
            maxHeight: 80,
            maxWidth: 80 
          ),
          child: Image.asset(
            'assets/${l.img}', 
            fit: BoxFit.cover
          ),
          
        ),
        title: Text(l.name),
        trailing: ElevatedButton(
          child: Text("Details"), 
          onPressed: ()=> checkDetails(l),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return ListView(
        children: 
          _data.map((e) => widgetBuilder(e)).toList()
    );
  }

}