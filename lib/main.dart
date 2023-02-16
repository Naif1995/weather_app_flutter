import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> _handleLocationPermission() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location services are disabled. Please enable the services')));
        return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permissions are denied')));
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location permissions are permanently denied, we cannot request permissions.')));
        return false;
      }
      return true;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,

// that case you can also remove them after copying the theme to your app.
      theme: FlexThemeData.light(
        scheme: FlexScheme.amber,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 28,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 23,
          blendOnColors: false,
          elevatedButtonRadius: 10.0,
          outlinedButtonRadius: 9.0,
          outlinedButtonBorderWidth: 1.0,
          outlinedButtonPressedBorderWidth: 1.0,
          inputDecoratorRadius: 40.0,
          inputDecoratorBorderWidth: 2.5,
          inputDecoratorFocusedBorderWidth: 5.0,
          popupMenuRadius: 5.0,
          popupMenuElevation: 3.0,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.outline,
          navigationBarUnselectedIconSchemeColor: SchemeColor.outline,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.amber,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          elevatedButtonRadius: 10.0,
          outlinedButtonRadius: 9.0,
          outlinedButtonBorderWidth: 1.0,
          outlinedButtonPressedBorderWidth: 1.0,
          inputDecoratorRadius: 40.0,
          inputDecoratorBorderWidth: 2.5,
          inputDecoratorFocusedBorderWidth: 5.0,
          popupMenuRadius: 5.0,
          popupMenuElevation: 3.0,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.outline,
          navigationBarUnselectedIconSchemeColor: SchemeColor.outline,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      // Use the above dark or light theme based on active themeMode.
      themeMode: ThemeMode.light,
      title: 'Chatter',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        //'/second': (context) => const SecondScreen(),
      },
    );
  }
}
