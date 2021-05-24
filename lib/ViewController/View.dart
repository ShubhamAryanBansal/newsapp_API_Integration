import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_app/Utility/SharedData.dart';
import 'ViewWeb.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  SharedData shared = SharedData();
  var now = DateTime.now();
  var time;
  String slot = '';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          title: Text(
            'SpaceFlight News',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontFamily: 'Quicksand-Regular',
            ),
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_alt_sharp),
              color: Colors.lightGreenAccent,
              iconSize: 32,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.cyan,
              iconSize: 34,
              onPressed: () {
              },
            )
          ],
          ),
        body: ListView.builder(
            itemCount: shared.fetchjson.length,
            itemBuilder: (context, index) {
              if(now.day == shared.fetchjson[index].updatedAt.day){
                time = now.hour - shared.fetchjson[index].updatedAt.hour;
                slot = ' hours ago';
              }else{
                time = now.day - shared.fetchjson[index].updatedAt.day;
                slot = ' day ago';
              }
              print('${shared.fetchjson[index].imageUrl}');
              return Padding(
                padding: const EdgeInsets.only(top: 10,left: 5, right: 5),
                child: Container(
                  height: height * .59,
                  width: width-50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
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
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewWeb('${shared.fetchjson[index].url}'),),);
                        },
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: height *.27,
                                  width: width-26.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomRight:  Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${shared.fetchjson[index].imageUrl}'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    height: height * .09,
                                    width: width - 40,
                                    child: Text(
                                      '${shared.fetchjson[index].title}',
                                      style: TextStyle(
                                        letterSpacing: .7,
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Quicksand-Regular'
                                      ),
                                      textAlign: TextAlign.start,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: height * .11,
                                    width: width - 40,
                                    child: Text(
                                      '${shared.fetchjson[index].summary}',
                                      style: TextStyle(
                                        letterSpacing: .7,
                                        color: Colors.blueGrey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Quicksand-Regular',
                                      ),
                                      textAlign: TextAlign.start,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ]
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(width: 10),
                                Text(
                                  '$time$slot',
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Quicksand-Regular',
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ]
                            ),
                          ],
                        ),
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
