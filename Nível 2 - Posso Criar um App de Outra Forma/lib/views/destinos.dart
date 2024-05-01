import 'package:flutter/material.dart';

class DestinosPage extends StatelessWidget {
  const DestinosPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color bgAppBar = const Color(0xFF008584);
    Color bgBody = const Color(0xFFF5F5F5);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Locais',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: bgAppBar,
      ),
      body: Container(
        color: bgBody,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          children: [
            _buildDestino(
              nome: 'Munich',
              pais: 'Alemanha',
              descricao:
                  'Munique é a capital da Baviera, na Alemanha, conhecida por sua rica história, cultura, cervejarias e arquitetura barroca.',
            ),
            _buildDestino(
              nome: 'Brasilia',
              pais: 'Brasil',
              descricao:
                  'Brasília é a capital do Brasil, conhecida por seu planejamento urbano modernista e arquitetura icônica, como o Congresso Nacional e a Catedral Metropolitana.',
            ),
            _buildDestino(
              nome: 'Beijing',
              pais: 'China',
              descricao:
                  'Pequim, ou Beijing, é a capital da China, famosa por sua rica história, cultura milenar, monumentos como a Cidade Proibida e a Grande Muralha, e por ser um centro político e cultural do país.',
            ),
            _buildDestino(
              nome: 'Barcelona',
              pais: 'Espanha',
              descricao:
                  'Barcelona é uma cidade vibrante na costa nordeste da Espanha, conhecida por sua arquitetura singular, praias deslumbrantes, vida noturna animada e cultura catalã distintiva.',
            ),
            _buildDestino(
              nome: 'Berlin',
              pais: 'Alemanha',
              descricao:
                  'Berlim é a capital da Alemanha, famosa por sua história tumultuada, arte de rua vibrante, vida noturna agitada e marcada pela presença de marcos históricos como o Portão de Brandemburgo e o Muro de Berlim.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestino(
      {required String nome, required String pais, required String descricao}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nome,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'País: $pais',
            style: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            descricao,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
