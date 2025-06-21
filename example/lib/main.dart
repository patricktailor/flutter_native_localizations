import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_native_localizations/flutter_native_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      localizationsDelegates: <LocalizationsDelegate>[
        FlutterNativeLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: <Locale>[
        Locale("en"),
        Locale("es"),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = FlutterNativeLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.getString("app_name") ?? "..."),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(localizations?.getString("welcome_message") ?? "..."),
          ],
        ),
      ),
    );
  }
}
