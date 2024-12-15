import 'package:flutter/material.dart';
import 'package:miner_values/provider/miner_value.dart';
import 'package:miner_values/widgets/miner_value_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  @override
  void initState() {
    super.initState();
    Provider.of<MinerValueProvider>(context, listen: false)
              .loadMinerValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valores de Minérios (Compra em BRL)'),
      ),
      body: Consumer<MinerValueProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.minerValue == null) {
            return const Center(child: Text('Erro ao carregar os dados.'));
          }

          return MinerValueList(provider.minerValue!);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Provider.of<MinerValueProvider>(context, listen: false)
              .loadMinerValues();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
