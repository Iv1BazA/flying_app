import 'package:country_app/const/model.dart';
import 'package:country_app/screens/add_item1_screen.dart';
import 'package:country_app/screens/main_screen.dart';
import 'package:country_app/screens/news_screen.dart';
import 'package:country_app/screens/onboarding1_screen.dart';
import 'package:country_app/screens/onboarding2_screen.dart';
import 'package:country_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ItemProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);
    itemProvider.loadItemsFromCache();
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff262D38),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      routes: {
        '/onboard2': (context) => OnBoarding2Widget(),
        '/main': (context) => MainWidget(),
        '/add': (context) => Add1Widget(),
        '/news': (context) => NewsWidget(),
        '/settings': (context) => SettingsWidget()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences prefs;
  bool showInstructions = true;

  @override
  void initState() {
    super.initState();
    checkInstructionsStatus();
  }

  Future<void> checkInstructionsStatus() async {
    prefs = await SharedPreferences.getInstance();
    bool shouldShowInstructions = prefs.getBool('showInstructions') ?? true;

    setState(() {
      showInstructions = shouldShowInstructions;
    });

    if (showInstructions) {
      await prefs.setBool('showInstructions', false);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OnBoarding1Widget()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainWidget()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
