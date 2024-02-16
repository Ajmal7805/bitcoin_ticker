// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:developer';
import 'package:bitcoin_ticker/coindata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apikey =
    'd1cb787cbcc3a33a2d775d0712ec94daa408fb7e19782eba54576f433ac742f2';

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

  Future getdata({String? cryptotype}) async {
    final response = await http.get(Uri.parse(
        'https://min-api.cryptocompare.com/data/price?fsym=$cryptotype&tsyms=$selectedcurrency&api_key={$apikey}'));

    return jsonDecode(response.body)[selectedcurrency];
  }

  @override
  Widget build(BuildContext context) {
    log('selected currency =$selectedcurrency');
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
          FutureBuilder(
            future: getdata(cryptotype: 'BTC'),
            builder: (context, snapshot) {
              return Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = ${snapshot.data} $selectedcurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          FutureBuilder(
            future: getdata(cryptotype: 'ETH'),
            builder: (context, snapshot) {
              return Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = ${snapshot.data} $selectedcurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          FutureBuilder(
              future: getdata(cryptotype: 'LTC'),
              builder: (context, snapshot) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 LTC = ${snapshot.data} $selectedcurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }),
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
