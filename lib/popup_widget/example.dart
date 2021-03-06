import 'package:flutter/material.dart';
import 'popup_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopupWidget Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopupWidget'),
      ),
      body: Center(
        child: RichText(
          textAlign: TextAlign.right,
          maxLines: 1,
          text: const TextSpan(
            style: TextStyle(color: Color(0xFF333333), fontSize: 15),
            children: [
              TextSpan(text: "Lord"),
              WidgetSpan(
                child: PopupWidget(
                  child: Icon(Icons.help_outline, size: 16, color: Colors.blue),
                  text: "Lord, I'm one, Lord",
                  contentSize: Offset(16, 16),
                ),
              ),
              TextSpan(text: "I'm five hundred miles away from home"),
              WidgetSpan(
                child: PopupWidget(
                  child: Icon(Icons.mood, size: 16, color: Colors.blue),
                  text: "away from home, away from home",
                  bgColor: Colors.white,
                  textColor: Colors.blue,
                  isShadow: true,
                  contentSize: Offset(16, 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
