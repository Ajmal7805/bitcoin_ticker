import 'package:bitcoin_ticker/pricescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      title: 'Bitcoin Ticker',
      home: const PriceScreen()));
}
