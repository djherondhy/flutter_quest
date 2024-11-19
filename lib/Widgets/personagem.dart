import 'package:flutter/material.dart';
import 'package:quest/Widgets/forca.dart';


class Personagem extends StatefulWidget {

  final String nome;
  final String classe;
  final int forca;
  final String foto;
  const Personagem(
      {required this.nome,
      required this.classe,
      required this.forca,
        required this.foto,
      super.key});

  @override
  State<Personagem> createState() => _PersonagemState();
}

class _PersonagemState extends State<Personagem> {
  double vida = 1;

  void vidaUp() {
    setState(() {
      if(vida <=1){
        vida+= (vida / widget.forca)/10;
      }
      if(vida>1){
        vida =1;
      }
    });
  }

  void vidaDown() {
    setState(() {
      if(vida>=0){
        vida-= (vida/ widget.forca)/10;
      }
      if(vida<0){
        vida=0;
      }
    });
  }

  String converteVida(double vida){
    double vida_convertida = vida*100;
    return vida_convertida.toInt().toString();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                          child: Image.asset(
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
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text( widget.nome,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                ),
                                 Text(widget.classe,
                                    style: TextStyle(
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
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: vidaUp,
                            child: Icon(Icons.arrow_drop_up),
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                backgroundColor: Colors.black12,
                                shadowColor: Colors.transparent,
                                minimumSize: Size(40, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                          ElevatedButton(
                            onPressed: vidaDown,
                            child: Icon(Icons.arrow_drop_down),
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                backgroundColor: Colors.black12,
                                shadowColor: Colors.transparent,
                                minimumSize: Size(40, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.deepPurpleAccent[200],
                        value: vida,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.favorite),
                          Text(converteVida(vida)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

