import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
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
  int num1 = 0, num2 = 0, result = 0;

  final TextEditingController t1 = TextEditingController(text: '0');
  final TextEditingController t2 = TextEditingController(text: '0');

  // Multiplication
  void doMultiplication() {
    setState(() {
      num1 = int.tryParse(t1.text) ?? 0;
      num2 = int.tryParse(t2.text) ?? 0;
      result = num1 * num2;
    });
  }

  // Division with zero-handling
  void doDivision() {
    setState(() {
      num1 = int.tryParse(t1.text) ?? 0;
      num2 = int.tryParse(t2.text) ?? 1;
      result = (num2 != 0) ? num1 ~/ num2 : 0; // Avoid divide by zero
    });
  }

  // Addition
  void doAddition() {
    setState(() {
      num1 = int.tryParse(t1.text) ?? 0;
      num2 = int.tryParse(t2.text) ?? 0;
      result = num1 + num2;
    });
  }

  // Subtraction
  void doSubtraction() {
    setState(() {
      num1 = int.tryParse(t1.text) ?? 0;
      num2 = int.tryParse(t2.text) ?? 0;
      result = num1 - num2;
    });
  }

  // Clear the inputs and result
  void clear() {
    setState(() {
      t1.clear();
      t2.clear();
      result = 0;
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
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: t1,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: 'Enter First Number'),
              ),
              TextField(
                controller: t2,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: 'Enter Second Number'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: doMultiplication,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text(
                      "*",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: doDivision,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text(
                      "/",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: doSubtraction,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: doAddition,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text(
                      "+",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Text(
                "Output: $result",
                style: const TextStyle(fontSize: 32),
              ),
              ElevatedButton(
                onPressed: clear,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  "Clear",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
