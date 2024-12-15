

import 'miner_values/dolar.dart';
import 'miner_values/gold.dart';
import 'miner_values/silver.dart';

class MinerValue {
  MinerValue({
     this.dolar,
     this.gold,
     this.silver,
  });
    Dolar? dolar;
    Gold? gold;
    Silver? silver;
  
  MinerValue.fromJson(Map<String, dynamic> json) {
  dolar = json['USDBRL'] != null ? Dolar.fromJson(json['USDBRL']) : null;
  gold = json['XAUUSD'] != null ? Gold.fromJson(json['XAUUSD']) : null;
  silver = json['XAGGUSD'] != null ? Silver.fromJson(json['XAGGUSD']) : null;
}
}