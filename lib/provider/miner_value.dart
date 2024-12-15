import 'package:flutter/foundation.dart';
import 'package:miner_values/API/get_miner_value.dart';
import 'package:miner_values/domain/miner_value.dart';

class MinerValueProvider with ChangeNotifier {
  MinerValue? minerValue;
  bool isLoading = false;
  

  final MinerValueService _service = MinerValueService();

  Future<void> loadMinerValues() async {
    isLoading = true;
    notifyListeners();

    try {
      final values = await _service.fetchMinerValues();
      if (values != null) {
        minerValue = values;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao carregar valores: $e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
