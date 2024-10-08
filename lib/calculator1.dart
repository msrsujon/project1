import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num1 = 0, num2 = 0, sum = 0;

  final TextEditingController t1 = TextEditingController(text: '0');
  final TextEditingController t2 = TextEditingController(text: '0');

  void doMultiplication() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doDivission() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 ~/ num2;
    });
  }

  void doAdd() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void doSubstraction() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
            child: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter First Number'),
              ),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Second Number'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        doMultiplication();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text(
                        "*",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        doDivission();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text(
                        "/",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        doSubstraction();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text(
                        "-",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        doAdd();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text(
                        "+",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              Text(
                "OutPut:$sum ",
                style: TextStyle(fontSize: 32),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
