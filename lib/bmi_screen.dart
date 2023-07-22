import 'package:bmi_calc/boxColumn.dart';
import 'package:flutter/material.dart';

class BMICalc extends StatefulWidget {
  const BMICalc({super.key});

  @override
  State<BMICalc> createState() => _BMICalcState();
}

class _BMICalcState extends State<BMICalc> {
  Color myColor = Colors.transparent;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  var result = TextEditingController();

  Calc_BMI(String weight, String height) async {
    var myDoubleWeight = double.parse(weight);
    var myDoubleHeight = double.parse(height);

    var res = (myDoubleWeight / (myDoubleHeight * myDoubleHeight));

    setState(() {
      result.text = res.toStringAsFixed(2);
      if (res < 18.5) {
        myColor = const Color(0xFF87B1D9);
      } else if (res >= 18.5 && res <= 24.9) {
        myColor = const Color(0xFF3DD365);
      } else if (res >= 25 && res <= 29.9) {
        myColor = const Color(0xFFEEE133);
      } else if (res >= 30 && res <= 34.9) {
        myColor = const Color(0xFFFD802E);
      } else if (res >= 35) {
        myColor = const Color(0xFFF95353);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF6DD5ED), Color(0xFF2193B0)]),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "BMI Calculator",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0038FF),
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: TextField(
                      controller: weightController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter your Weight in meters(m)'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: TextField(
                      autofocus: false,
                      controller: heightController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter your Height in meters(m)'),
                    ),
                  ),
                  //Calculate Button
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: SizedBox(
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Calc_BMI(
                                weightController.text, heightController.text);
                          },
                          style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xFF0038FF)),
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                          child: const Text(
                            'Calculate BMI',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  //Result display box
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      color: myColor,
                      height: 100,
                      width: 300,
                      child: Center(
                        child: Text(
                          'BMI:${result.text}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BoxColumn(
                          textDescription: 'UnderWeight',
                          boxColor: Colors.purple),
                      BoxColumn(
                        textDescription: 'Normal',
                        boxColor: Colors.orange,
                      ),
                      BoxColumn(
                          textDescription: 'OverWeight',
                          boxColor: Colors.yellow),
                      BoxColumn(
                        textDescription: 'Obese',
                        boxColor: Colors.brown,
                      ),
                      BoxColumn(
                        textDescription: 'Extreme',
                        boxColor: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
