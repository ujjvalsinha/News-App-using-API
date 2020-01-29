import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class Description extends StatefulWidget {
  final List data;
  final int index;

  Description(this.data, this.index);

  @override
  _DescriptionState createState() => _DescriptionState(data, index);
}

class _DescriptionState extends State<Description> {
  final List data;
  final int index;
  _DescriptionState(this.data, this.index);

  spin() {
    return SpinKitWave(color: Colors.redAccent, type: SpinKitWaveType.start);
  }

  getdetail() async {
    String url1 = data[index]["url"];
    if (await canLaunch(url1)) {
      await launch(url1);
    } else {
      throw 'Could not launch $url1';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News@Fast"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              child: Icon(Icons.share),
              onTap: () {
                setState(() {
                  Share.share("${data[index]["title"]}\n${data[index]["url"]}");
                });
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:8.0,right: 8,),
        child: ListView(
          children: <Widget>[
            data[widget.index]["urlToImage"] != null
                ? Image.network(
                    data[widget.index]["urlToImage"],
                    width: double.infinity,
                  )
                : spin(),
            SizedBox(
              height: 20,
            ),
            data[index]["title"] != null
                ? Text(
                    data[index]["title"],
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )
                : Container(height: 400, child: spin()),
            SizedBox(
              height: 30,
            ),
            data[index]["content"] != null
                ? Text(
                    "${data[index]["content"]}  For Full Article Press Read Full Article Button",
                    style: TextStyle(fontSize: 22),
                  )
                : Container(height: 400, child: spin()),
            Container(
              margin: EdgeInsets.all(35),
              child: MaterialButton(
                elevation: 3,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.redAccent,
                child: Text(
                  "Read Full Article",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: (){
                  getdetail();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
