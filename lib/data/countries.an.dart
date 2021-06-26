import 'package:flutter/material.dart';
import '../data.dart';
import 'package:english_words/english_words.dart';
import 'package:badges/badges.dart';
import '../Favorite.dart';
import 'countrydetails.dart';

// ignore: camel_case_types
class Countries_an extends StatefulWidget {
  @override
  _Countries_anState createState() => _Countries_anState();
}

// ignore: camel_case_types
class _Countries_anState extends State<Countries_an> {
  List _countries = [];
  List<Map> filteredlist;
  List words = nouns.take(250).toList();
  List countrysaved = [];
  var jsonData = Data();
  void loadCountry() async {
    await jsonData.getCountry();
    setState(() {
      _countries = jsonData.country;
    });

    filteredlist = [];
    for (var item in _countries) {
      if (item['continent'] != null && item['continent'] == 'AN') {
        filteredlist.add(item);
      }
    }
  }

  @override
  void initState() {
    loadCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(TextSpan(
            text: 'Countries ',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w600,
                fontSize: 20),
            children: [
              TextSpan(
                  text: 'of ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
              TextSpan(
                  text: 'Antarctica ',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
            ])),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, 'Nav');
            }),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          Badge(
            badgeContent: Text('${countrysaved.length}'),
            toAnimate: false,
            position: BadgePosition.topEnd(end: 5, top: 0),
            child: IconButton(
              icon: Icon(Icons.star),
              onPressed: () => pushToFavorite(context),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: filteredlist.length,
            itemBuilder: (BuildContext context, int index) {
              final bool alreadySaved =
                  countrysaved.contains(filteredlist[index]);
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => CountryDetails(
                              selectedCountry: filteredlist[index],
                            )),
                  );
                },
                leading: Text(filteredlist[index]['emoji']),
                title: Text(filteredlist[index]['name']),
                subtitle: Text(filteredlist[index]['native']),
                trailing: IconButton(
                    icon: Icon(
                      alreadySaved ? Icons.star : Icons.star_border,
                      color: alreadySaved ? Colors.blueGrey : Colors.blueGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        if (alreadySaved) {
                          countrysaved.remove(filteredlist[index]);
                        } else {
                          countrysaved.add(filteredlist[index]);
                        }
                      });
                    }),
                selectedTileColor: Colors.grey,
              );
            }),
      ),
    );
  }

  Future pushToFavorite(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            Favorite(favoriteItems: countrysaved),
      ),
    );
  }
}
