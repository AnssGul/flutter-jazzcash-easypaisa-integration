import 'package:flutter/material.dart';
import 'package:paymob_pakistan/paymob_payment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double userBalance = 0.0;
  bool hasPaidInitialFee = false;

  Future<void> _initializePayment(PaymentType paymentType) async {
    try {
      PaymentInitializationResult response =
          await PaymobPakistan.instance.initializePayment(
        currency: "PKR",
        amountInCents: "1500000",
      );

      PaymobPakistan.instance.makePayment(
        context,
        currency: "PKR",
        amountInCents: "1500000",
        paymentType: paymentType,
        authToken: response.authToken,
        orderID: response.orderID,
        onPayment: (result) {
          if (result.success ?? false) {
            setState(() {
              hasPaidInitialFee = true;
              userBalance = 500.0; // Add the first day’s credit.
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Payment Successful!")),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Payment Failed: ${result.message}")),
            );
          }
        },
      );
    } catch (err) {
      debugPrint("Payment failed: $err");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An error occurred during payment.")),
      );
    }
  }

  void _addDailyCredit() {
    if (hasPaidInitialFee) {
      setState(() {
        userBalance += 500;
      });
    }
  }

  Future<void> _withdrawBalance() async {
    if (DateTime.now().weekday == DateTime.sunday) {
      setState(() {
        userBalance = 0.0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Withdrawal Successful!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Withdrawals are only allowed on Sundays.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!hasPaidInitialFee) ...[
              ElevatedButton(
                onPressed: () => _initializePayment(PaymentType.jazzcash),
                child: const Text("Pay Initial Fee with JazzCash"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _initializePayment(PaymentType.easypaisa),
                child: const Text("Pay Initial Fee with EasyPaisa"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _initializePayment(PaymentType.card),
                child: const Text("Pay Initial Fee with Credit Card"),
              ),
            ],
            const SizedBox(height: 16),
            Text("Balance: PKR ${userBalance.toStringAsFixed(2)}"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _withdrawBalance,
              child: const Text("Withdraw Balance"),
            ),
          ],
        ),
      ),
    );
  }
}
