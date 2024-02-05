import 'package:app_fluter_1/dados/info.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value){
    if(value != null && value.isEmpty){
      return true;
    }
    return false;
  }

  bool difficultyVaidator(String? value){
    if(value != null && value.isEmpty){
      if(int.parse(value) > 5 || int.parse(value) < 1){
        return true;
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Nova Tarefa'),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nome da Tarefa: ',
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (valueValidator(value)) {
                        return 'Preencha esse campo.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    controller: difficultyController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite o Nivel de Dificuldade: ',
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (difficultyVaidator(value)){
                        return 'Preencha esse campo com um valor entre 1 e 5';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (text) {
                      setState(() {});
                    },
                    keyboardType: TextInputType.url,
                    controller: imageController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Coloque a URL de uma imagem: ',
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (valueValidator(value)) {
                        return 'Preencha esse campo.';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 100,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageController.text,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(Icons.no_photography_outlined);
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // print(nameController.text);
                      // print(int.parse(difficultyController.text));
                      // print(imageController.text);

                      TaskDados.of(widget.taskContext)!.newtask(
                          nameController.text,
                          imageController.text,
                          int.parse(difficultyController.text));

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tarefa salva')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Adicionar'),
                ),
              ],
            ),
          ),
        ));
  }
}
