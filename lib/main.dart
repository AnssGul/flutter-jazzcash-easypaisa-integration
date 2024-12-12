import 'package:crpyto_app/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:paymob_pakistan/paymob_payment.dart';

import 'package:flutter/material.dart';
import 'package:paymob_pakistan/paymob_payment.dart';

void main() {
  PaymobPakistan.instance.initialize(
    apiKey: "{YOUR_API_KEY}",
    integrationID: 123456,
    iFrameID: 123456,
    jazzcashIntegrationId: 123456,
    easypaisaIntegrationID: 123456,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF007aec),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
