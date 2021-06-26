import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Favorite extends StatefulWidget {
  List favoriteItems;

  Favorite({Key key, @required this.favoriteItems}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites countries'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, 'Nav');
            }),
      ),
      body: ListView.separated(
        itemCount: widget.favoriteItems.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) => ListTile(
          leading: Text(widget.favoriteItems[index]['emoji']),
          title: Text(widget.favoriteItems[index]['name']),
        ),
      ),
    );
  }
}
