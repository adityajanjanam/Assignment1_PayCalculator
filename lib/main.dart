import 'package:flutter/material.dart';

void main() {
  runApp(const PayCalculatorApp());
}

class PayCalculatorApp extends StatelessWidget {
  const PayCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PayCalculatorScreen(),
    );
  }
}

class PayCalculatorScreen extends StatefulWidget {
  const PayCalculatorScreen({Key? key}) : super(key: key);

  @override
  _PayCalculatorScreenState createState() => _PayCalculatorScreenState();
}

class _PayCalculatorScreenState extends State<PayCalculatorScreen> {
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  double regularPay = 0.0;
  double overtimePay = 0.0;
  double totalPay = 0.0;
  double tax = 0.0;

  void calculatePay() {
    double hours = double.tryParse(hoursController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;

    if (hours <= 40) {
      regularPay = hours * rate;
      overtimePay = 0.0;
    } else {
      regularPay = 40 * rate;
      overtimePay = (hours - 40) * rate * 1.5;
    }

    totalPay = regularPay + overtimePay;
    tax = totalPay * 0.18;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Calculator'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: hoursController,
              decoration: const InputDecoration(
                labelText: 'Hours Worked',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: rateController,
              decoration: const InputDecoration(
                labelText: 'Hourly Rate',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculatePay,
              child: const Text('Calculate Pay'),
            ),
            const SizedBox(height: 16),
            Text('Regular Pay: \$${regularPay.toStringAsFixed(2)}'),
            Text('Overtime Pay: \$${overtimePay.toStringAsFixed(2)}'),
            Text('Total Pay: \$${totalPay.toStringAsFixed(2)}'),
            Text('Tax: \$${tax.toStringAsFixed(2)}'),
            const Spacer(),
            const Text(
              'Aditya Janjanam\nStudent ID: 12345678',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
