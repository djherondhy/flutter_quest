import 'package:flutter/material.dart';
import 'package:quest/components/forca.dart';
import 'package:quest/data/personagem_dao.dart';

class Personagem extends StatefulWidget {
  final String nome;
  final String classe;
  final int forca;
  final String foto;

  Personagem(
      {required this.nome,
      required this.classe,
      required this.forca,
      required this.foto,
      super.key});
  double vida = 1;
  @override
  State<Personagem> createState() => _PersonagemState();
}

class _PersonagemState extends State<Personagem> {


  void vidaUp() {
    setState(() {
      if (widget.vida <= 1) {
        widget.vida += (widget.vida / widget.forca) / 10;
      }
      if (widget.vida > 1) {
        widget.vida = 1;
      }
    });
  }

  void vidaDown() {
    setState(() {
      if (widget.vida >= 0) {
        widget.vida -= (widget.vida / widget.forca) / 10;
      }
      if (widget.vida < 0) {
        widget.vida = 0;
      }
    });
  }

  void delete() {
    PersonagemDao().delete(widget.nome);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Personagem deletado, recarregue!')),
    );
  }

  String converteVida(double vida) {
    double vidaConvertida = vida * 100;
    return vidaConvertida.toInt().toString();
  }

  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 170,
        ),
        Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black12,
                      ),
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.foto,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 170,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.nome,
                                style: const TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.classe,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.blueGrey)),
                              Forca(forcaValue: widget.forca),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: vidaUp,
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                backgroundColor: Colors.black12,
                                shadowColor: Colors.transparent,
                                minimumSize: const Size(40, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            child: const Icon(Icons.arrow_drop_up),
                          ),
                          ElevatedButton(
                            onPressed: vidaDown,
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                backgroundColor: Colors.black12,
                                shadowColor: Colors.transparent,
                                minimumSize: const Size(40, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            child: const Icon(Icons.arrow_drop_down),
                          ),

                        ],
                      ),
                      ElevatedButton(
                        onPressed: delete,
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            backgroundColor: Colors.black12,
                            shadowColor: Colors.transparent,
                            minimumSize: const Size(40, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100))),
                        child: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.deepPurpleAccent[200],
                      value: widget.vida,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.favorite),
                      Text(converteVida(widget.vida)),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
