import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CalculatorView extends StatefulWidget{
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  num x = 0;
  num y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
  }
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          CalculationDisplay(hint: 'Enter 1st number',controller: displayOneController),
          const SizedBox(height: 30,),
          CalculationDisplay(hint: 'Enter 2nd number',controller: displayTwoController),
          const SizedBox(height: 30,),
          Text(z.toString(),style: TextStyle(
              fontSize: 60,fontWeight: FontWeight.bold),),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(onPressed:() {
                setState(() {
                  z = num.tryParse(displayOneController.text)! +
                      num.tryParse(displayTwoController.text)!;
                });
              },
                child: const Icon(Icons.add),),
              FloatingActionButton(onPressed:(){
                setState(() {
                  z = num.tryParse(displayOneController.text)! -
                      num.tryParse(displayTwoController.text)!;
                });
              },
                child: const Icon(CupertinoIcons.minus),),
              FloatingActionButton(onPressed:(){
                setState(() {
                  z = num.tryParse(displayOneController.text)! *
                      num.tryParse(displayTwoController.text)!;
                });
              },
                child: const Icon(CupertinoIcons.multiply),),
              FloatingActionButton(onPressed:(){
                setState(() {
                  z = num.tryParse(displayOneController.text)! /
                      num.tryParse(displayTwoController.text)!;
                });
              },
                child: const Icon(CupertinoIcons.divide),)
            ],
          ),
          const SizedBox(height: 10,),
          FloatingActionButton.extended(
            onPressed:(){
              setState(() {
                x=0; y=0; z=0; displayOneController.clear(); displayTwoController.clear();
              });
            },
            label:const Text('Clear'),
          )
        ],
      ),
    );
  }
}

class CalculationDisplay extends StatelessWidget {

  const CalculationDisplay({super.key, this.hint = 'Enter a number', required this.controller});
  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          hintText: hint,
          hintStyle: TextStyle( fontSize: 32,color: Colors.black )
      ),
    );
  }
}
