import 'package:bitcoin/api/coinapi.dart';
import 'package:bitcoin/coin_data.dart';
import 'package:bitcoin/model/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  static String selectedCurrency = 'TRY';
  int selectedCurrencyIndex = currenciesList.indexOf(selectedCurrency);
  CoinApi api = CoinApi(quote: selectedCurrency);

  List<Text> getPickerItems() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return pickerItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                child: FutureBuilder<Currency>(
                  future: api.getRate('BTC'),
                  builder:
                      (BuildContext context, AsyncSnapshot<Currency> snapshot) {
                    print(snapshot);
                    if (snapshot.hasData) {
                      return Text(
                        '1 BTC = ${snapshot.data.rate.toStringAsFixed(4)} $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Container(
                          child: Center(child: CircularProgressIndicator()));
                    }
                  },
                ),
              ),
            ),
          ),
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
                child: FutureBuilder<Currency>(
                  future: api.getRate('ETH'),
                  builder:
                      (BuildContext context, AsyncSnapshot<Currency> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        '1 ETH = ${snapshot.data.rate.toStringAsFixed(4)} $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Container(
                          child: Center(child: CircularProgressIndicator()));
                    }
                  },
                ),
              ),
            ),
          ),
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
                child: FutureBuilder<Currency>(
                  future: api.getRate('LTC'),
                  builder:
                      (BuildContext context, AsyncSnapshot<Currency> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        '1 LTC = ${snapshot.data.rate.toStringAsFixed(4)} $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Container(
                          child: Center(child: CircularProgressIndicator()));
                    }
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                  initialItem: selectedCurrencyIndex),
              backgroundColor: Colors.lightBlue,
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex) {
                setState(() {
                  selectedCurrency = currenciesList[selectedIndex];
                });
              },
              children: getPickerItems(),
            ),
          ),
        ],
      ),
    );
  }
}
