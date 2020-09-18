import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int temperature;
  String message;
  String weatherIcon;
  String cityName;
  String feelsLike;
  int pressure;
  int humidity;
  int seaLevel;
  int groundLevel;
  String country;
  String name;
  String description;
  String mainDescription;
  int visibility;
  double speed;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        cityName = ' ';
        feelsLike = '';
        pressure = 0;
        humidity = 0;
        seaLevel = 0;
        groundLevel = 0;
        country = '';
        name = '';
        description = '';
        mainDescription = '';
        visibility = 0;
        speed = 0.0;
        return;
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      var feels = weatherData['main']['feels_like'];
      feelsLike = feels.toStringAsFixed(0);
      pressure = weatherData['main']['pressure'];
      humidity = weatherData['main']['humidity'];
      seaLevel = weatherData['main']['sea_level'];
      groundLevel = weatherData['main']['grnd_level'];

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      var mainDesc = weatherData['weather'][0]['main'];
      mainDescription = mainDesc.toString();

      var desc = weatherData['weather'][0]['description'];
      description = desc.toString();

      country = weatherData['sys']['country'];

      cityName = weatherData['name'];
      visibility = weatherData['visibility'];
      speed = weatherData['wind']['speed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData =
                          await WeatherModel().getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.refresh,
                      size: 32.0,
                      color: Colors.white,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.search,
                      size: 32.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  '$cityName , $country',
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.lightBlue.shade700,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            Text('$weatherIcon', style: kText),
                            Text('$mainDescription', style: kMedium),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text('$description', style: kNormalText),
                          ],
                        ),
                        Column(
                          children: [
                            Text('$temperature', style: kTemp),
                            Text(
                              'Feels Like $feelsLike',
                              style: kNormalText,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.lightBlue.shade700,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            Text('Speed', style: kNormalText2),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text('$speed km/hr', style: kMedium),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Humidity', style: kNormalText2),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text('$humidity km', style: kMedium),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Visibility', style: kNormalText2),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text('${visibility / 100}%', style: kMedium),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.lightBlue.shade700,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            Text('Sea Level', style: kNormalText2),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text('$seaLevel', style: kMedium),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Pressure', style: kNormalText2),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text('$pressure', style: kMedium),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Ground Level', style: kNormalText2),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text('$groundLevel', style: kMedium),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 15.0),
              //   child: Row(
              //     children: <Widget>[
              //       Text(
              //         '$temperature',
              //         style: kTempTextStyle,
              //       ),
              //       Text(
              //         '$weatherIcon',
              //         style: kConditionTextStyle,
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(right: 15.0),
              //   child: Text(
              //     '$message in $cityName!',
              //     textAlign: TextAlign.right,
              //     style: kMessageTextStyle,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
