import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/ui/widgets/actions/BlaButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ButtonTestScreen(),
    );
    
  }
}

class ButtonTestScreen extends StatelessWidget {
  const ButtonTestScreen({super.key});

  void _handlePrimaryPress() {
    print("Primary BlaButton pressed! ✅");
  }

  void _handleSecondaryPress() {
    print("Secondary BlaButton pressed! ⚡");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BlaButton Test")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlaButton(
              text: "Primary Button",
              icon: Icons.check,
              isPrimary: true,
              onPressed: _handlePrimaryPress,
            ),
            const SizedBox(height: 20),
            BlaButton(
              text: "Secondary Button",
              isPrimary: false,
              onPressed: _handleSecondaryPress,
            ),
            const SizedBox(height: 20),
            BlaButton(
              text: "Disabled Button",
              isPrimary: true,
              enable: false,
              onPressed: () {
                // This will NOT run because enable = false
                print("This should never print!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
