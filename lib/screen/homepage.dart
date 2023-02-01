import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  double heightValue = 1.8;
  int weightValue = 64;
  int ageValue = 22;
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("BMI:"),
          content: SingleChildScrollView(
            child:
            Text(((weightValue/heightValue/heightValue)*10000).toString()),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  Container drawDimensionContainer(
      String title, int dimensionValue, int identifier) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.white54),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(dimensionValue.toString(),
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white38,
                    shape: const CircleBorder()),
                onPressed: () {
                  setState(() {
                    identifier == 0 ? weightValue++ : ageValue++;
                  });
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white38,
                    shape: const CircleBorder()),
                onPressed: () {
                  setState(() {
                    identifier == 0 ? weightValue-- : ageValue--;
                  });
                },
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container drawGenderContainer(String title, IconData icons) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons,
            size: 64,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.white54),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCUATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                drawGenderContainer('MALE', Icons.male),
                drawGenderContainer("FEMALE", Icons.female)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("HEIGHT",
                      style: TextStyle(fontSize: 16, color: Colors.white54)),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text((heightValue * 100).toInt().toString(),
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700)),
                    const Text(
                      " cm",
                    ),
                  ]),
                  Slider(
                    min: .22,
                    max: 2.0,
                    thumbColor: Colors.red,
                    activeColor: Colors.red,
                    inactiveColor: Colors.white54,
                    value: heightValue,
                    onChanged: (double value) {
                      setState(() {
                        heightValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                drawDimensionContainer("WEIGHT", weightValue, 0),
                drawDimensionContainer("AGE", ageValue, 1)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 18),
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.all(24),
                ),
                onPressed: () {
                  _showDialog();
                },
                child: const Text("CALCULATE")),
          )
        ],
      ),
    );
  }
}
