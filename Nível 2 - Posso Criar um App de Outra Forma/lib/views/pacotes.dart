import 'package:flutter/material.dart';

class PacotesPage extends StatelessWidget {
  const PacotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color bgAppBar = const Color(0xFF008584);
    Color bgBody = const Color(0xFFE0E0E0); 

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pacotes de Viagem / Travel Packages',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: bgAppBar,
      ),
      body: Container(
        color: bgBody, 
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildPacote(
              tipo: 'Bronze',
              descricao: 'Escolha seu destino com hospedagem por 5 dias.',
              preco: 'R\$ 5.000,00',
            ),
            _buildPacote(
              tipo: 'Prata',
              descricao: 'Escolha seu destino com hospedagem + café da manhã por 7 dias.',
              preco: 'R\$ 8.000,00',
            ),
            _buildPacote(
              tipo: 'Gold',
              descricao: 'Escolha seu destino com hospedagem + all inclusive por 15 dias.',
              preco: 'R\$ 15.000,00',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPacote({required String tipo, required String descricao, required String preco}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tipo,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            descricao,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Preço: $preco',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 86, 33, 243), 
            ),
          ),
        ],
      ),
    );
  }
}