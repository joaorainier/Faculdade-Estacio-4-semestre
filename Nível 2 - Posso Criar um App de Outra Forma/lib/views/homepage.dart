import 'package:flutter/material.dart';
import 'destino.dart';
import 'destinos.dart';
import 'pacotes.dart';
import 'contatos.dart';
import 'sobre.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<Destino> _destinos = [
    Destino(
      imagePath: 'assets/images/berlin.png',
      title: 'Berlin',
      location: 'Berlin, Alemanha',
      bodyText: 'Berlim é frequentemente conhecida como "A Cidade Cinza" ("Die Graue Stadt"), um apelido originado da sua aparência durante os períodos de guerra e divisão, quando a cidade estava marcada por muitos edifícios danificados e áreas negligenciadas. No entanto, após a reunificação e a revitalização da cidade, Berlim também é chamada de "A Cidade que Nunca Dorme" ("Die Stadt, die niemals schläft"), em referência à sua vibrante vida noturna e à sua natureza culturalmente diversa e dinâmica.',
      likes: 2842
    ),
    Destino(
      imagePath: 'assets/images/beijing.png',
      title: 'Beijing / Pequim',
      location: 'Beijing, China',
      bodyText: 'Pequim, a capital da China, é frequentemente chamada de "A Cidade Proibida" ("紫禁城" em chinês, que significa literalmente "a cidade purpúrea proibida"). Este nome deriva do fato de que durante a dinastia Ming e Qing, somente o imperador, sua família e os funcionários mais importantes tinham permissão para entrar na Cidade Proibida, um imenso complexo palaciano. Além disso, Pequim é também conhecida como "A Cidade Imperial" ("皇城" em chinês, que significa "cidade imperial"), em referência ao seu papel histórico como a capital de várias dinastias imperiais chinesas ao longo dos séculos.',
      likes: 3489
    ),
    Destino(
      imagePath: 'assets/images/brasilia.png',
      title: 'Brasilia',
      location: 'Brasilia, Brasil',
      bodyText: 'Brasília, a capital do Brasil, é frequentemente chamada de "A Capital Federal" ou simplesmente "Capital". Este nome reflete sua função como o centro político e administrativo do país. Além disso, Brasília também é conhecida como "Cidade Monumento" devido à sua arquitetura modernista e seus monumentos icônicos, projetados por Oscar Niemeyer e Lúcio Costa, que lhe conferem uma aparência única e distintiva.',
      likes: 1406
    ),
    Destino(
      imagePath: 'assets/images/munich.png',
      title: 'Munique',
      location: 'Munique, Alemanha',
      bodyText: 'Munique, a capital da Baviera, na Alemanha, é conhecida como "A Capital Mundial da Cerveja" devido à sua rica tradição cervejeira e à famosa Oktoberfest, o maior festival de cerveja do mundo, realizado anualmente na cidade. Além disso, Munique é frequentemente chamada de "A Cidade das Torres" ("Die Stadt der Türme" em alemão), devido à sua bela paisagem urbana pontilhada por numerosas torres e igrejas históricas.',
      likes: 5000
    ),
    Destino(
      imagePath: 'assets/images/barcelona.png',
      title: 'Barcelona',
      location: 'Barcelona, Espanha',
      bodyText: 'Barcelona é frequentemente conhecida como "A Cidade Condal" ("Ciudad Condal" em catalão), um título que remonta ao período medieval quando a cidade era governada pelos Condes de Barcelona. Além disso, Barcelona é chamada de "A Pérola do Mediterrâneo" devido à sua localização deslumbrante ao longo da costa do Mar Mediterrâneo e sua beleza arquitetônica única, incluindo as obras-primas de Antoni Gaudí.',
      likes: 3500
    ),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentIndex < _destinos.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bgAppBar = const Color(0xFF008584);
    Color bgBody = const Color(0xFFF5F5F5);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bem-vindo(a) Welcome',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: bgAppBar,
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DestinosPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.card_travel),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PacotesPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.contact_phone),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContatoPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SobrePage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: bgBody,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(45),
              child: Text(
                'Rainier Viagens',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextPage(
                      imagePath: _destinos[_currentIndex].imagePath,
                      title: _destinos[_currentIndex].title, 
                      location: _destinos[_currentIndex].location,
                      bodyText: _destinos[_currentIndex].bodyText, 
                      likes: _destinos[_currentIndex].likes
                    )),
                  );
                },
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: _destinos.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _destinos[index].imagePath,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Destino {
  final String imagePath;
  final String title;
  final String bodyText;
  final String location;
  final int likes;

  Destino({
    required this.imagePath,
    required this.title,
    required this.bodyText,
    required this.location,
    required this.likes
  });
}
