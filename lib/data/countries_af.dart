import 'package:flutter/material.dart';
import '../data.dart';
import 'package:english_words/english_words.dart';
import 'package:badges/badges.dart';
import '../Favorite.dart';
import 'countrydetails.dart';

// ignore: camel_case_types
class Countries_af extends StatefulWidget {
  @override
  _Countries_afState createState() => _Countries_afState();
}

// ignore: camel_case_types
class _Countries_afState extends State<Countries_af> {
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
      if (item['continent'] != null && item['continent'] == 'AF') {
        filteredlist.add(item);
      }
    }
  }

  dynamic filter() {
    filteredlist = [];
    for (var item in _countries) {
      if (item['continent'] != null && item['continent'] == 'AF') {
        filteredlist.add(item);
      }
    }
  }

  @override
  void initState() {
    loadCountry();
    filter();
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
                  text: 'Africa ',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
            ])),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, 'Home');
            }),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          Badge(
            badgeContent: Text('${countrysaved.length}'),
            toAnimate: false,
            position: BadgePosition.topEnd(end: 0, top: 0),
            child: IconButton(
              icon: Icon(Icons.star),
              onPressed: () => pushToFavorite(context),
            ),
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
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

class DataSearch extends SearchDelegate<DataSearch> {
  List country = _Countries_afState().filteredlist;
  List recentCountry = [
    'Angola',
    'Burkina Faso',
    'Burundi',
    'Benin',
    'Botswana'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = " ";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ListView.builder(
              itemBuilder: (context, index) => query != country[index]['name']
                  ? Text(" ")
                  : ListTile(
                      title: country[index]['name'],
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) => CountryDetails(
                                    selectedCountry: country[index],
                                  )),
                        );
                      },
                    )),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCountry
        : country.where((p) => p.startWith(query)).toList();
    return suggestionList.isEmpty
        ? Text(
            'No Results Found',
            style: TextStyle(fontSize: 20.0),
          )
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                showResults(context);
              },
              leading: Icon(Icons.flag),
              title: Text.rich(TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ],
              )),
            ),
            itemCount: suggestionList.length,
          );
  }
}
