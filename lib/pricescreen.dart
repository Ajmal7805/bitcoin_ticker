// ignore_for_file: prefer_const_constructors
import 'package:bitcoin_ticker/coindata.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedcurrency = 'USD';
  List<DropdownMenuItem<String>> getdropdownitem() {
    List<DropdownMenuItem<String>> dropdownitemslist = [];
    for (String currency in currenciesList) {
      var newitems = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownitemslist.add(newitems);
    }
    return dropdownitemslist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        titleTextStyle: TextStyle(color: Colors.white),
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: DropdownButton<String>(
                value: selectedcurrency,
                items: getdropdownitem(),
                onChanged: (value) {
                  setState(() {
                    selectedcurrency = value!;
                  });
                },
              )),
        ],
      ),
    );
  }
}
