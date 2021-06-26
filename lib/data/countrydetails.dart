import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CountryDetails extends StatelessWidget {
  final Map selectedCountry;

  const CountryDetails({Key key, this.selectedCountry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedCountry['emoji']} ${selectedCountry['name']}\n',
          style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10.0,
            shadowColor: Colors.blueAccent,
            color: Colors.blueGrey.withOpacity(0.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Name: ${selectedCountry['name']}\n\n'
                'Native: ${selectedCountry['native']}\n\n'
                'Phone: ${selectedCountry['phone']}\n\n'
                'Continent: ${selectedCountry['continent']}\n\n'
                'Capital: ${selectedCountry['capital']}\n\n'
                'Currency: ${selectedCountry['currency']}\n\n'
                'Languages: ${selectedCountry['languages']}\n\n'
                'Emoji: ${selectedCountry['emoji']}\n\n'
                'EmojiU: ${selectedCountry['emojiU']}\n\n',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    inherit: false),
              ),
            ),
          ),
          ),
    );
  }
}
