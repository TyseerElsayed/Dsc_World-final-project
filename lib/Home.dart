import 'dart:ui';
import 'package:dsc_world/main.dart';
// import 'package:dsc_world/ui/global/Theme/app_Theme.dart';
import 'package:dsc_world/ui/global/Theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _continents = [];
  var jsonData = Data();
  void loadContinent() async {
    await jsonData.getContinents();
    setState(() {
      _continents = jsonData.continent;
    });
  }

  @override
  void initState() {
    loadContinent();
    super.initState();
  }

  List _image = [
    'africa',
    'antarctica',
    'asia',
    'europe',
    'north_america',
    'australia',
    'south_america'
  ];
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(TextSpan(text: 'C.',style: TextStyle(color: Colors.indigo), children: [
          TextSpan(text: 'O.',style: TextStyle(color: Colors.white)),
          TextSpan(text: 'W',style: TextStyle(color: Colors.purple)),
        ])),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration:
                    BoxDecoration(color: Colors.black.withBlue(37).withRed(21)),
                child: Image.asset('images/map-world.jpg', fit: BoxFit.fill)),
            ListTile(
              title: Text('Dark Mode',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
              trailing: Switch(
                  value: isActive,
                  onChanged: (val) {
                    setState(() {
                      isActive = val;
                      if (val == true) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => MyApp()
                                .buildWithTheme(context,
                                    ThemeState(themeData: ThemeData.dark()))));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => MyApp()
                                .buildWithTheme(context,
                                    ThemeState(themeData: ThemeData.light()))));
                      }
                    });
                  }),
            ),
            // ListView.builder(
            //     padding: EdgeInsets.all(8),
            //     itemCount: AppTheme.values.length,
            //     itemBuilder: (context, index) {
            //       final itemAppTheme = AppTheme.values[index];
            //       return Card(
            //         color: appThemeData[itemAppTheme].primaryColor,
            //         child: ListTile(
            //           title: Text(
            //             itemAppTheme.toString(),
            //             style: appThemeData[itemAppTheme].textTheme.bodyText1,
            //           ),
            //           onTap: () {
            //             BlocProvider.of<ThemeBloc>(context).dispatch(
            //               ThemeChanged(theme: itemAppTheme),
            //             );
            //           },
            //         ),
            //       );
            //     }),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            padding: EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20),
            addAutomaticKeepAlives: true,
            itemCount: _image.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  if (_continents[index] == _continents[0]) {
                    Navigator.pushNamed(context, 'countries_af');
                  } else if (_continents[index] == _continents[1]) {
                    Navigator.pushNamed(context, 'countries_an');
                  } else if (_continents[index] == _continents[2]) {
                    Navigator.pushNamed(context, 'countries_as');
                  } else if (_continents[index] == _continents[3]) {
                    Navigator.pushNamed(context, 'countries_eu');
                  } else if (_continents[index] == _continents[4]) {
                    Navigator.pushNamed(context, 'countries_na');
                  } else if (_continents[index] == _continents[5]) {
                    Navigator.pushNamed(context, 'countries_au');
                  } else if (_continents[index] == _continents[6]) {
                    Navigator.pushNamed(context, 'countries_sa');
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/${_image[index]}.png',
                          height: 120,
                        ),
                        SizedBox(height: 5),
                        Text(
                          _continents[index],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
