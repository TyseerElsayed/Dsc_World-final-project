  // List _continents = [];
  // var jsonData = Data();
  // void loadContinent() async {
  //   await jsonData.getContinents();
  //   setState(() {
  //     _continents = jsonData.continent;
  //   });
  // }

  // @override
  // void initState() {
  //   loadContinent();
  //   super.initState();
  // }

  // List _image = [
  //   'africa',
  //   'antarctica',
  //   'asia',
  //   'europe',
  //   'north_america',
  //   'australia',
  //   'south_america'
  // ];


  // ________________________________________________________________




   // appBar: AppBar(
      //   title: Text('COW'),
      //   centerTitle: true,
      //   backgroundColor: Colors.deepOrangeAccent,
      // ),
      // drawer: Drawer(
      //   child: IconButton(icon: Icon(Icons.menu), onPressed: null),
      // ),


//________________________________________________________________________




// Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//             padding: EdgeInsets.all(15),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1.0,
//                 crossAxisSpacing: 15,
//                 mainAxisSpacing: 20),
//             addAutomaticKeepAlives: true,
//             itemCount: _image.length,
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                 onTap: () {
//                   if (_continents[index] == _continents[0]) {
//                     Navigator.pushNamed(context, 'countries_af');
//                   } else if (_continents[index] == _continents[1]) {
//                     Navigator.pushNamed(context, 'countries_an');
//                   } else if (_continents[index] == _continents[2]) {
//                     Navigator.pushNamed(context, 'countries_as');
//                   } else if (_continents[index] == _continents[3]) {
//                     Navigator.pushNamed(context, 'countries_eu');
//                   } else if (_continents[index] == _continents[4]) {
//                     Navigator.pushNamed(context, 'countries_na');
//                   } else if (_continents[index] == _continents[5]) {
//                     Navigator.pushNamed(context, 'countries_au');
//                   } else if (_continents[index] == _continents[6]) {
//                     Navigator.pushNamed(context, 'countries_sa');
//                   }
//                 },
//                 child: Container(
//                     alignment: Alignment.center,
//                     margin: EdgeInsets.all(3),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.amber,
//                     ),
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           'images/${_image[index]}.png',
//                           height: 120,
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           _continents[index],
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white),
//                         ),
//                       ],
//                     )),
//               );
//             }),
//       ),