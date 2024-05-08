import 'package:flutter/material.dart';
import 'home_view.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({
    super.key,
  });
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter learn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue
      ),
      home: HomeView(),
    );
  }
}