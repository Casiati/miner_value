import 'package:flutter/material.dart';
import 'package:miner_values/domain/miner_value.dart';
import '../utils/value_formatter.dart';

class MinerValueList extends StatelessWidget {
  final MinerValue minerValue;

  const MinerValueList(this.minerValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Dólar para Real (USD -> BRL)'),
          subtitle: Text('Compra: R\$${formatValue(minerValue.dolar?.bid)}'),
        ),
        ListTile(
          title: const Text('Ouro para Real (XAU -> BRL)'),
          subtitle: Text(
            'Compra: R\$${convertToBRL(minerValue.gold?.bid, minerValue.dolar?.bid)}',
          ),
        ),
        ListTile(
          title: const Text('Prata para Real (XAG -> BRL)'),
          subtitle: Text(
            'Compra: R\$${convertToBRL(minerValue.silver?.bid, minerValue.dolar?.bid)}',
          ),
        ),
      ],
    );
  }
}
