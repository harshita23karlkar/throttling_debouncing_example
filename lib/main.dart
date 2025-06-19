import 'package:flutter/material.dart';
import 'package:throttling_debouncing/services/easy_debounce.dart';
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
  final Throttle throttle = Throttle(
    duration: const Duration(milliseconds: 500),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder:
              (context) => SafeArea(
                child: Column(
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          throttle.call(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Button tapped!")),
                            );
                          });
                        },
                        child: const Text("Tap me"),
                      ),
                    ),
                    CustomElevatedButton(
                      action: () {
                        throttle.call(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Button tapped!")),
                          );
                        });
                      },
                      keyName: "custom_button",
                      child: const Text("Tap me"),
                      duration: const Duration(milliseconds: 500),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
