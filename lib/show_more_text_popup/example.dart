import 'package:flutter/material.dart';

import 'show_more_text_popup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Show more text',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Show More"),
      ),
      body: DescriptionTextWidget(text: description),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;
  GlobalKey key = GlobalKey();
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 40) {
      firstHalf = widget.text.substring(0, 40);
      secondHalf = widget.text.substring(40, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Row(
              children: <Widget>[
                Text(firstHalf + " "),
                InkWell(
                  key: const Key("show_more_ink_well"),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "show more",
                        key: key,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  onTap: () {
                    showMoreText(widget.text);
                  },
                ),
              ],
            ),
    );
  }

  void showMoreText(String text) {
    ShowMoreTextPopup popup = ShowMoreTextPopup(context,
        text: text,
        textStyle: const TextStyle(color: Colors.black),
        height: 200,
        width: 100,
        backgroundColor: const Color(0xFF16CCCC),
        padding: const EdgeInsets.all(4.0),
        borderRadius: BorderRadius.circular(10.0), onDismiss: () {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Dismiss callback!")));
    });

    /// show the popup for specific widget
    popup.show(
      widgetKey: key,
    );
  }
}
