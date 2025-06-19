import 'package:flutter/material.dart';
import 'package:throttling_debouncing/services/throttling.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Throttle throttle = Throttle(duration: const Duration(milliseconds: 500));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              throttle.call(() {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Button tapped!")));
              });
            },
            child: Text("Tap me"),
          ),
        ),
      ),
    );
  }
}
