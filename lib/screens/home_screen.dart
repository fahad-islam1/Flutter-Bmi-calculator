

import 'package:bmi_calculator/widgets/leftbar.dart';
import 'package:bmi_calculator/widgets/rightbar.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double _bmiResult = 0;
  String _finalResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.w300, color: accentHexColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 120,
                child: TextField(
                  controller: _heightController,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 36,
                      color: accentHexColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 36,
                          fontWeight: FontWeight.w300)),
                ),
              ),
              SizedBox(
                width: 120,
                child: TextField(
                  controller: _weightController,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 36,
                      color: accentHexColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      )),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              double w = double.parse(_weightController.text);

              double f = double.parse(_heightController.text);
              double h = f / 3.281;
              setState(() {
                _bmiResult = w / (h * h);
                if (_bmiResult > 25) {
                  _finalResult = "You're over weight";
                } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
                  _finalResult = "You have normal weight";
                } else {
                  _finalResult = "You are Under weight";
                }
              });
            },
            child: Text(
              "Calculate",
              style: TextStyle(
                  fontSize: 22,
                  color: accentHexColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            _bmiResult.toStringAsFixed(2),
            style: TextStyle(
                fontSize: 90,
                // fontWeight: FontWeight.w400,
                color: accentHexColor),
          ),
          const SizedBox(height: 30),
          Visibility(
            visible: _finalResult.isNotEmpty,
            child: Text(
              _finalResult,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 32,
                  color: accentHexColor),
            ),
          ),
          const SizedBox(height: 10),
          const LeftBar(barwidth: 50),
          const SizedBox(height: 20),
          const LeftBar(barwidth: 70),
          const SizedBox(height: 20),
          const LeftBar(barwidth: 50),
          const SizedBox(height: 20),
          const RightBar(barwidth: 70),
          const SizedBox(height: 50),
          const RightBar(barwidth: 70)
        ],
      )),
    );
  }
}
