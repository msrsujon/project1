import 'package:flutter/material.dart';

void main() {
  runApp(const ZakatCalculatorApp());
}

class ZakatCalculatorApp extends StatelessWidget {
  const ZakatCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zakat Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ZakatCalculatorHome(),
    );
  }
}

class ZakatCalculatorHome extends StatefulWidget {
  const ZakatCalculatorHome({super.key});

  @override
  _ZakatCalculatorHomeState createState() => _ZakatCalculatorHomeState();
}

class _ZakatCalculatorHomeState extends State<ZakatCalculatorHome> {
  // Controllers to capture input from user
  final TextEditingController savingsController = TextEditingController();
  final TextEditingController goldController = TextEditingController();
  final TextEditingController silverController = TextEditingController();
  final TextEditingController otherAssetsController = TextEditingController();

  double zakat = 0.0;

  // Method to calculate zakat
  void calculateZakat() {
    double savings = double.tryParse(savingsController.text) ?? 0.0;
    double gold = double.tryParse(goldController.text) ?? 0.0;
    double silver = double.tryParse(silverController.text) ?? 0.0;
    double otherAssets = double.tryParse(otherAssetsController.text) ?? 0.0;

    double totalWealth = savings + gold + silver + otherAssets;

    // Zakat is 2.5% of total qualifying assets
    zakat = totalWealth * 0.025;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Zakat Calculator',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Input for savings
              TextField(
                controller: savingsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Savings (Cash, Bank Balance, etc.)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Input for gold
              TextField(
                controller: goldController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Value of Gold (in currency)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Input for silver
              TextField(
                controller: silverController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Value of Silver (in currency)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Input for other assets
              TextField(
                controller: otherAssetsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Other Qualifying Assets (e.g. business)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Button to calculate zakat
              ElevatedButton(
                onPressed: calculateZakat,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                child: const Text(
                  'Calculate Zakat',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              const SizedBox(height: 30),

              // Display the Zakat amount
              Text(
                'Zakat Payable: ${zakat.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
