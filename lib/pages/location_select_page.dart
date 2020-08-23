import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prayer_time/model/location.dart';
import 'package:prayer_time/provider/location_provider.dart';
import 'package:prayer_time/provider/text_provider.dart';

class LocationSelectPage extends StatefulWidget {
  LocationSelectPage({Key key}) : super(key: key);

  @override
  _LocationSelectPageState createState() => _LocationSelectPageState();
}

class _LocationSelectPageState extends State<LocationSelectPage> {
  final pageController = PageController();

  Country country;

  City city;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(TextProvider().selectLocation),
        ),
        body: PageView(
          controller: pageController,
          children: [
            buildCountryList(),
            country == null
                ? Center(child: Text(TextProvider().shouldSelectCountry))
                : buildCityList(),
            city == null
                ? Center(child: Text(TextProvider().shouldSelectCity))
                : buildCountyList(),
          ],
        ),
      ),
    );
  }

  Widget buildCountyList() {
    return Column(
      children: [
        SizedBox(height: 20),
        buildTitle(TextProvider().selectCounty),
        Expanded(
          child: FutureBuilder<List<County>>(
            future: LocationProvider().getCounties(city.sehirID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].ilceAdi),
                      onTap: () {
                        LocationProvider()
                            .setCurrentLocation(snapshot.data[index]);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  Widget buildCityList() {
    return Column(
      children: [
        SizedBox(height: 20),
        buildTitle(TextProvider().selectCity),
        Expanded(
          child: FutureBuilder<List<City>>(
            future: LocationProvider().getCities(country.ulkeID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].sehirAdi),
                      onTap: () {
                        setState(() {
                          city = snapshot.data[index];
                        });
                        pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                    );
                  },
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  Widget buildCountryList() {
    return Column(
      children: [
        SizedBox(height: 20),
        buildTitle(TextProvider().selectCountry),
        Expanded(
          child: FutureBuilder<List<Country>>(
            future: LocationProvider().getCountries(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].ulkeAdi),
                      onTap: () {
                        setState(() {
                          country = snapshot.data[index];
                        });
                        pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                    );
                  },
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  Text buildTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
