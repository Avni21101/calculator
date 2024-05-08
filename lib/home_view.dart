import 'package:flutter/material.dart';
import 'calculator_view.dart';


class HomeView extends StatelessWidget{
  const HomeView({super.key});  // constructor

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: CalculatorView()),
    );
  }
}




