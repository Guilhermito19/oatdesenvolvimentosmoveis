import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Define a cor primária do tema como roxo
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TelaInicial(), // Rota da tela inicial
        '/segunda': (context) => SegundaTela(), // Rota da segunda tela
      },
    );
  }
}

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _numeroRepeticoes = 0;

  void _incrementarNumeroRepeticoes() {
    setState(() {
      _numeroRepeticoes++; // Incrementa o número de repetições
    });
  }

  void _decrementarNumeroRepeticoes() {
    if (_numeroRepeticoes > 0) {
      setState(() {
        _numeroRepeticoes--; // Decrementa o número de repetições, se for maior que zero
      });
    }
  }

  void _irParaSegundaTela() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SegundaTela(
            numeroRepeticoes:
                _numeroRepeticoes), // Navega para a segunda tela e passa o número de repetições como parâmetro
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de Academia'), // Título da tela
        centerTitle: true, // Centraliza o título
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                './assets/images/academia1.jpg'), // Define uma imagem de fundo
            fit: BoxFit.cover, // Ajusta a imagem ao tamanho do container
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_numeroRepeticoes', // Exibe o número de repetições
                style: TextStyle(fontSize: 48.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _decrementarNumeroRepeticoes(); // Chama a função para decrementar o número de repetições
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple, // Define a cor do botão como roxo
                    ),
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      _incrementarNumeroRepeticoes(); // Chama a função para incrementar o número de repetições
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple, // Define a cor do botão como roxo
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed:
                    _irParaSegundaTela, // Chama a função para ir para a segunda tela
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // Define a cor do botão como roxo
                ),
                child: Text(
                  'Terminei o exercício',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SegundaTela extends StatelessWidget {
  final int? numeroRepeticoes;

  SegundaTela({this.numeroRepeticoes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            numeroRepeticoes! > 0 ? 'Parabéns' : 'Resultado',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                '../assets/images/academia3.jpg'), // Define uma imagem de fundo
            fit: BoxFit.cover, // Ajusta a imagem ao tamanho do container
          ),
        ),
        child: Center(
          child: numeroRepeticoes != null && numeroRepeticoes! > 0
              ? Text(
                  'Você fez $numeroRepeticoes repetições', // Exibe o número de repetições
                  style: TextStyle(fontSize: 24.0),
                )
              : Text(
                  'Sem repetições registradas'), // Exibe uma mensagem caso não haja repetições
        ),
      ),
    );
  }
}
