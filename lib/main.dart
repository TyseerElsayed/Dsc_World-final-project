import 'package:dsc_world/ui/global/Theme/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Favorite.dart';
import 'Home.dart';
import 'data/countries.an.dart';
import 'data/countries_af.dart';
import 'data/countries_as.dart';
import 'data/countries_au.dart';
import 'data/countries_eu.dart';
import 'data/countries_na.dart';
import 'data/countries_sa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: buildWithTheme),
    );
  }

  Widget buildWithTheme(BuildContext context, ThemeState state) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.themeData,
          title: 'Dsc World',
          home: Nav(),
          initialRoute: 'main',
          routes: {
            'Nav': (context) => Nav(),
            'Home': (context) => Home(),
            'Favorites': (context) => Favorite(
                  favoriteItems: [],
                ),
            'countries_af': (context) => Countries_af(),
            'countries_an': (context) => Countries_an(),
            'countries_as': (context) => Countries_as(),
            'countries_eu': (context) => Countries_eu(),
            'countries_na': (context) => Countries_na(),
            'countries_au': (context) => Countries_au(),
            'countries_sa': (context) => Countries_sa(),
          });
    }
}

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  List<Widget> tabItem = [
    Home(),
    Favorite(
      favoriteItems: [],
    )
  ];
  var _currentTab = 0;
  // ignore: unused_element
  void _selectTab(index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabItem[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _selectTab(value);
        },
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home', tooltip: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
            tooltip: "Favorites",
          ),
        ],
        unselectedFontSize: 12,
        selectedFontSize: 17,
        currentIndex: _currentTab,
        selectedItemColor: Colors.white,
      ),
    );
  }
}
