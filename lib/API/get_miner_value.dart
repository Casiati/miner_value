import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:miner_values/domain/miner_value.dart';

class MinerValueService {
  Future<MinerValue?> fetchMinerValues() async {
    final url = Uri.parse(
        'http://economia.awesomeapi.com.br/json/last/USD-BRL,XAGG-USD,XAU-USD');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Ajuste para as chaves corretas
        return MinerValue.fromJson({
          'USDBRL': data['USDBRL'],
          'XAUUSD': data['XAUUSD'],
          'XAGGUSD': data['XAGGUSD'],
        });
      } else {
        if (kDebugMode) {
          print('Erro na requisição: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao buscar os valores: $e');
      }
    }
    return null;
  }
}
