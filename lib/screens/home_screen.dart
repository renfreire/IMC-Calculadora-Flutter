import 'dart:ffi';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _opcaoSelecionada = "nenhuma";
  String mensagemresultado = "";
  final alturacontroller = TextEditingController();
  final pesocontroller = TextEditingController();
  double _resultado = 0.0;

  void selecionarGenero(String texto) {
    setState(() {
      _opcaoSelecionada = texto;
      mensagemresultado = "";
      alturacontroller.text = "";
      pesocontroller.text = "";
    });
  }

  calcularIMC(String peso, String altura) {
    print(_resultado);

    setState(() {
      _resultado = double.parse(peso) / (pow(double.parse(altura), 2));

      if (_resultado < 18.5) {
        mensagemresultado = "Abaixo do peso";
      } else if (_resultado >= 18.5 && _resultado <= 24.9) {
        mensagemresultado = "Peso Normal";
      } else if (_resultado >= 25 && _resultado <= 29.9) {
        mensagemresultado = "Acima do Peso";
      } else if (_resultado >= 30 && _resultado <= 34.9) {
        mensagemresultado = "Obesidade Grau I";
      } else if (_resultado >= 35 && _resultado <= 39.9) {
        mensagemresultado = "Obesidade Grau II";
      } else {
        mensagemresultado = "Obesidade Grau III ou Morbido";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    pesocontroller.addListener(() {});
    alturacontroller.addListener(() {});
  }

  @override
  void dispose() {
    alturacontroller.dispose();
    pesocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var maxwidth = MediaQuery.of(context).size.width;
    var maxheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: AutoSizeText(
                      'Calculadora de IMC',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: _opcaoSelecionada == "nenhuma"
                        ? maxwidth * 0.4
                        : _opcaoSelecionada == "feminino"
                            ? maxwidth * 0.3
                            : maxwidth * 0.5,
                    height: _opcaoSelecionada == "nenhuma"
                        ? maxheight * 0.2
                        : _opcaoSelecionada == "feminino"
                            ? maxheight * 0.1
                            : maxheight * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: _opcaoSelecionada == "masculino"
                          ? Border.all(
                              color: Color.fromARGB(255, 195, 197, 197),
                              width: 5)
                          : Border.all(width: 0),
                      color: Colors.lightBlue,
                    ),
                    child: GestureDetector(
                      onTap: () => selecionarGenero("masculino"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: _opcaoSelecionada == "nenhuma"
                                    ? 40
                                    : _opcaoSelecionada == "feminino"
                                        ? 20
                                        : 55,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                "Masculino",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: _opcaoSelecionada == "nenhuma"
                                      ? 22
                                      : _opcaoSelecionada == "masculino"
                                          ? 24
                                          : 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: _opcaoSelecionada == "nenhuma"
                        ? maxwidth * 0.4
                        : _opcaoSelecionada == "masculino"
                            ? maxwidth * 0.3
                            : maxwidth * 0.5,
                    height: _opcaoSelecionada == "nenhuma"
                        ? maxheight * 0.2
                        : _opcaoSelecionada == "masculino"
                            ? maxheight * 0.1
                            : maxheight * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: _opcaoSelecionada == "feminino"
                          ? Border.all(
                              color: Color.fromARGB(255, 195, 197, 197),
                              width: 5)
                          : Border.all(width: 0),
                      color: Color.fromARGB(255, 222, 135, 240),
                    ),
                    child: GestureDetector(
                      onTap: () => selecionarGenero("feminino"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: _opcaoSelecionada == "nenhuma"
                                    ? 40
                                    : _opcaoSelecionada == "masculino"
                                        ? 20
                                        : 55,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                "Feminino",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: _opcaoSelecionada == "nenhuma"
                                      ? 22
                                      : _opcaoSelecionada == "feminino"
                                          ? 24
                                          : 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextField(
                      controller: alturacontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.expand),
                          hintText: 'Insira sua altura',
                          labelText: 'Insira sua altura'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: pesocontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.monitor_weight_outlined),
                          hintText: 'Insira seu peso',
                          labelText: 'Insira seu peso'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AutoSizeText(
                      mensagemresultado,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mensagemresultado != "Peso Normal"
                            ? Colors.red
                            : Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => calcularIMC(
                          pesocontroller.text, alturacontroller.text),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        onPrimary: Colors.black54,
                        elevation: 5,
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text("Calcular"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
