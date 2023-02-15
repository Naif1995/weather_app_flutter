import 'dart:developer';

import 'package:flutter/material.dart';
import '../models/condtion_model.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../widgets/drop_down_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Weather> weatheDetails;
  late Future<Condtion> condtion;
  late double code;

  @override
  void initState() {
    super.initState();
    weatheDetails = WeatherService().getWeatherDetails('Riyadh');
    weatheDetails.then((value) => {
          log(value.current.condition.code.toString()),
          code = value.current.condition.code});
    condtion = WeatherService().getIconAndCode();
    // condtion.then((value) => {log(value.condtionList[0].code.toString())});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 35,
                  ),
                ),
                Container(
                  child: CustomDropdownButton(
                      onChangedValue: (ValueChanged) => {print(ValueChanged)}),
                ),
                Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 35,
                  ),
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    print('object');
                    showModalBottomSheet<dynamic>(
                      isScrollControlled: true,
                      isDismissible: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: size.height / 1.5,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Modal BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                //create weather image from network

                // Container(
                //   padding: EdgeInsets.all(16),
                //   child: FutureBuilder<Weather>(
                //     future: weatheDetails,
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return Text(snapshot.data!.current.condition.text);
                //       } else if (snapshot.hasError) {
                //         return Text('${snapshot.error}');
                //       }
                //       return const CircularProgressIndicator();
                //     },
                //   ),
                // ),
                //image icon
                // ImageIcon(
                //   size: 100,
                //   AssetImage('assets/weather/day/$code.png'),
                // )

              ],
            )
          ],
        ),
      ),
    );
  }
}
