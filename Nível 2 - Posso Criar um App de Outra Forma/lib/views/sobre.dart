import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color bgAppBar = const Color(0xFF008584); 
    Color bgBody = const Color(0xFFF5F5F5);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre a empresa / About us.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: bgAppBar,
      ),
      body: Container(
        color: bgBody,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Sua viagem começa aqui / Your Journey Starts Here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Seja bem-vindo à nossa agência de viagens, onde transformamos destinos em aventuras inesquecíveis e memórias para toda a vida. Na Agência de Viagens dos Sonhos, nossa paixão é explorar o mundo e proporcionar experiências excepcionais para cada cliente.',
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Dos cumes nevados das montanhas às praias ensolaradas com areias douradas, estamos comprometidos em transformar seus sonhos de viagem em experiências reais. Vai além de simplesmente reservar voos e hotéis; estamos aqui para criar memórias que durarão para sempre.',
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Estamos comprometidos em oferecer uma experiência de viagem tranquila, desde a reserva até o seu retorno. Colaboramos com parceiros confiáveis globalmente para garantir que cada aspecto da sua jornada seja planejado e executado com precisão. Sua tranquilidade é nossa prioridade.',
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
