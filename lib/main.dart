import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/calendar_v2.dart';
import 'Pages/discord_clone_v1.dart';

import 'package:test_app/Components/runtime_variables.dart';
import 'package:test_app/Theme/theme_data.dart';

bool mode = true;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // mode = prefs.getBool('mode') ?? true;
  runApp(const App());
}

_updateMode() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // mode = prefs.getBool('mode') ?? true;
  // print('$mode');
  await prefs.setBool('mode', mode);
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  void modeSwitcher() {
    _updateMode();
    setState(() {
      mode = !mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _updateMode();
    return MaterialApp(
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      theme: mode ? AppTheme.dark2 : AppTheme.light2,
      title: 'Flutter Demo',
      routes: {
        '/CalendarV2': (context) => const CalendarShow2(),
        '/DiscordCloneV1': (context) => const DiscordCloneV1(),
        //
      },
      home: Main(modeSwitcher),
    );
  }
}

class Main extends StatefulWidget {
  final Function notifyParent;

  const Main(this.notifyParent, {Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    Common.isDarkMode = brightness == Brightness.dark;
    if (brightness == Brightness.dark) {
      log("message");
    }
    Common.width = MediaQuery.of(context).size.width;
    Common.height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Widget Develop"),
        actions: [
          Switch(
            value: mode,
            onChanged: (value) {
              widget.notifyParent();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/CalendarV2"),
              child: const Text("Calendar V2", style: TextStyle(fontSize: 30)),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/DiscordCloneV1"),
              child: const Text("Discord App Clone", style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
