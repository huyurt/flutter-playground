import 'package:firstapp/util/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  int tipPercentage = 0;
  int personCounter = 1;
  double billAmount = 0.0;

  Color purple = HexColor('#6908D6');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20.5),
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Total Payment / Person',
                    style: TextStyle(fontSize: 15.0, color: purple),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '\$ ${calculateTotalPaymentPerPerson(billAmount, personCounter, tipPercentage)}',
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: purple),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.blueGrey.shade100, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: purple),
                  decoration: InputDecoration(
                      prefixText: 'Bill Amount: ',
                      prefixIcon: Icon(Icons.attach_money)),
                  onChanged: (String value) {
                    try {
                      billAmount = double.parse(value);
                    } catch (ex) {
                      billAmount = 0.0;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Split',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (personCounter > 1) {
                                personCounter--;
                              }
                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: purple.withOpacity(0.1)),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    color: purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '$personCounter',
                          style: TextStyle(
                              color: purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              personCounter++;
                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: purple.withOpacity(0.1)),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tip',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        '\$ ${calculateTotalTip(billAmount, personCounter, tipPercentage).toStringAsFixed(2)}',
                        style: TextStyle(
                            color: purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '$tipPercentage%',
                      style: TextStyle(
                        color: purple,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 50,
                      activeColor: purple,
                      inactiveColor: Colors.grey,
                      divisions: 100,
                      value: tipPercentage.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          tipPercentage = newValue.round();
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  calculateTotalPaymentPerPerson(
      double billAmount, int personCount, int tipPercentage) {
    var totalPaymentPerPerson =
        (calculateTotalTip(billAmount, personCount, tipPercentage) +
                billAmount) /
            personCount;
    return totalPaymentPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int personCount, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}
