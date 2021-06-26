import 'package:badges/badges.dart';
import 'package:dsc_world/data/countrydetails.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import '../Favorite.dart';
import '../data.dart';

// ignore: camel_case_types
class Countries_na extends StatefulWidget {
  @override
  _Countries_naState createState() => _Countries_naState();
}

// ignore: camel_case_types
class _Countries_naState extends State<Countries_na> {
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
      if (item['continent'] != null && item['continent'] == 'NA') {
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
                  text: 'North America ',
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
            position: BadgePosition.topEnd(end: 5.0, top: 0.0),
            child: IconButton(
                icon: Icon(Icons.star),
                onPressed: () {
                  pushToFavorite(context);
                }),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
