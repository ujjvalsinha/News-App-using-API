import 'dart:convert';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/Description.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var btn1=false;
   void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
  String tittle = "News@Fast";
  spin() {
    return SpinKitWave(color: Colors.redAccent, type: SpinKitWaveType.start);
  }

  //String defheadline = "";
  List data;
 // static String addurl = "";
  String url =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=2d876e297540454b908c7258890cb059";
  Future<String> getjsondata() async {
    var responese = await http.get(Uri.encodeFull(url));
    setState(() {
      var convertdata = json.decode(responese.body);
      data = convertdata["articles"];
      print(data);
    });
  }

  var a = true;
  fun() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        getjsondata();
      }
    } on SocketException catch (_) {
      print("object");
    }
  }

  @override
  void initState() {
    fun();
    // getjsondata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return Scaffold(
          appBar: AppBar(
            title: Text(tittle),
            backgroundColor: Colors.redAccent,
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                 title: Text(
                    "Category",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ), 
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 2,
                  color: Colors.black,
                ),

                ListTile(
                  title: Text(
                    "All",
                    style: TextStyle(fontSize: 28,),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    tittle="News@Fast";
                    url =
                        "https://newsapi.org/v2/top-headlines?country=in&apiKey=2d876e297540454b908c7258890cb059";
                    getjsondata();
                    Navigator.pop(context);
                  },
                ),
               
                Container(
                  height: 1,
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Business",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    tittle = "Business";
                    url =
                        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=2d876e297540454b908c7258890cb059";
                    getjsondata();
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Entertainment",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    tittle = "Entertainment";
                    url =
                        "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=2d876e297540454b908c7258890cb059";
                    getjsondata();
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Health",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    tittle = "Health";
                    url =
                        "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=2d876e297540454b908c7258890cb059";
                    getjsondata();
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Science",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    tittle = "Science";
                    url =
                        "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=2d876e297540454b908c7258890cb059";
                    getjsondata();
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Sports",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    tittle = "Sports";
                    url =
                        "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=2d876e297540454b908c7258890cb059";
                    getjsondata();
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Technolgy",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    tittle = "Technolgy";
                    url =
                        "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=2d876e297540454b908c7258890cb059";
                    getjsondata();
                    Navigator.pop(context);
                  },
                ),
              

              ],
            ),
          ),
          body: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Container(
                        height: 125,
                        width: 100,
                        child: data[index]["urlToImage"] != null
                            ? Image.network(
                                data[index]["urlToImage"],
                                fit: BoxFit.fill,
                              )
                            : spin()),
                    title: data[index]["title"] != null
                        ? Container(
                            child: Text(
                              data[index]["title"],
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : spin(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(data, index)),
                      );
                    },
                  ),
                ),
              );
            },
          ));
    } else {
      return Scaffold(
        body: Center(
          child: Text("data"),
        ),
      );
    }
  }
}
