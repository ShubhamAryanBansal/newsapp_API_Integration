import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewWeb extends StatefulWidget {
  String url;

  ViewWeb(this.url);
  @override
  _ViewWebState createState() => _ViewWebState();
}

class _ViewWebState extends State<ViewWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Description',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontFamily: 'Quicksand-Regular',
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
