import 'package:newsapp/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Homepage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';



main(){
  runApp( DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,
          
        );
      }
    )
  
);}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new Homepage(),
      title: new Text('News@Fast',
      style: new TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 36.0
      ),),
      image: new Image.asset("images/logo.png"),
      backgroundColor: Colors.redAccent,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.white,
      
      
      
      
      
    );
  }
}