import 'package:flutter/material.dart';

class ContatoPage extends StatelessWidget {
  const ContatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color bgAppBar = const Color(0xFF008584);
    Color bgBody = const Color(0xFFF5F5F5);
    Color textColor = Colors.black; 

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contato',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: bgAppBar,
      ),
      body: Container(
        color: bgBody, 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contate-nos',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Email: rainier@viagens.com.br',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Whatsapp (61)99999-0000',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
