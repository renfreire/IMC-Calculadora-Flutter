import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var opcaoSelecionada = "nenhuma";

  selecionarGenero(String texto) {
    setState(() {
      opcaoSelecionada = texto;
    });
  }

  @override
  Widget build(BuildContext context) {
    var maxwidth = MediaQuery.of(context).size.width;
    var maxheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: AutoSizeText(
                    'Calculadora de IMC',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
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
                  width: opcaoSelecionada == "nenhuma"
                      ? maxwidth * 0.4
                      : opcaoSelecionada == "feminino"
                          ? maxwidth * 0.3
                          : maxwidth * 0.5,
                  height: opcaoSelecionada == "nenhuma"
                      ? maxheight * 0.20
                      : opcaoSelecionada == "feminino"
                          ? maxheight * 0.10
                          : maxheight * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue,
                  ),
                  child: GestureDetector(
                    onTap: selecionarGenero("masculino"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.male,
                              size: opcaoSelecionada == "nenhuma"
                                  ? 40
                                  : opcaoSelecionada == "masculino"
                                      ? 60
                                      : 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              "Masculino",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: opcaoSelecionada == "nenhuma"
                                      ? 22
                                      : opcaoSelecionada == "masculino"
                                          ? 26
                                          : 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: opcaoSelecionada == "nenhuma"
                      ? maxwidth * 0.4
                      : opcaoSelecionada == "feminino"
                          ? maxwidth * 0.3
                          : maxwidth * 0.5,
                  height: opcaoSelecionada == "nenhuma"
                      ? maxheight * 0.20
                      : opcaoSelecionada == "feminino"
                          ? maxheight * 0.10
                          : maxheight * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 222, 135, 240),
                  ),
                  child: GestureDetector(
                    onTap: selecionarGenero("feminino"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.female,
                              size: 60,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              "Feminino",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
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
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.expand),
                        hintText: 'Insira sua altura',
                        labelText: 'Insira sua altura'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.expand),
                        hintText: 'Insira seu peso',
                        labelText: 'Insira seu peso'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
