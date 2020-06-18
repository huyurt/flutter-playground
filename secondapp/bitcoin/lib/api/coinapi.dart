import 'dart:convert';

import 'package:bitcoin/model/currency.dart';
import 'package:http/http.dart' as http;

const url = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '7CB1D44A-F1F0-499E-8548-D39F012C89F2';

class CoinApi {
  CoinApi({this.quote});

  final String quote;

  Future<Currency> getRate(String base) async {
    var response = await http.get('$url/$base/$quote?apikey=$apiKey');
    if (response.statusCode == 200) {
      return Currency.fromJson(json.decode(response.body));
    }
    throw Exception('Error getting currency rate: ${response.body}');
  }
}
