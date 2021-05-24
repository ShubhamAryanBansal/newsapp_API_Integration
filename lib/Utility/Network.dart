import 'package:flutter/material.dart';
import 'package:hello_app/Modal/APIClient.dart';
import 'package:hello_app/Utility/SharedData.dart';
import 'package:hello_app/ViewController/View.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class Network extends StatefulWidget {

  String data = '';
  @override
  NetworkState createState() => NetworkState();
}
class NetworkState extends State<Network> {
SharedData client = SharedData();

  Future<void> getData() async {
    try {
      var url1 = Uri.parse('https://spaceflightnewsapi.net/api/v2/articles');
      http.Response response = await http.get(url1);
      widget.data = response.body;
      //final jsondata = welcomeFromJson(widget.data);
      client.fetchjson = welcomeFromJson(widget.data);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => View()));
      var now = DateTime.now();
      print(now.day);
      print(client.fetchjson.first.updatedAt.day);
    } catch (e) {
      //print(e);
    }
  }

  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      getData();
    });
  }

@override
Widget build(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return Scaffold(
    body: Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.grey[400],
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 29,left: 12, right: 12),
              child: Container(
                height: height * .57,
                width: width-55,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 100,
                      spreadRadius: 0,
                      offset: Offset(2.0, 5.0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            );
          }),
    ),
  );
}
}

