import 'package:flutter/material.dart';
import 'dificulty.dart';

// ignore: must_be_immutable
class Tasks extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  Tasks(this.nome, this.foto,this.dificuldade, {Key? key}) : super(key: key);

  int nivel = 0;

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {


  bool assetOrNetwork(){
    if(widget.foto.contains('ttps')){
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
              ),
            height: 140,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect( borderRadius: BorderRadius.circular(8),
                        child: assetOrNetwork() ? Image.asset(widget.foto,
                          fit: BoxFit.cover,
                        ) : Image.network(widget.foto, fit: BoxFit.cover,)
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Dificulty(levelDificuldade: widget.dificuldade),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 68,
                        width: 68,
                        child: ElevatedButton(
                          onPressed: (){
                            setState((){
                              widget.nivel++;
                            });

                          },
                          child:  const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: widget.dificuldade > 0 ? (widget.nivel/widget.dificuldade)/10 : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Nivel: ${widget.nivel}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}