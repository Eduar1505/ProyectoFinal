import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _recordatorios = [];
  final TextEditingController _textController = TextEditingController();

  void _agregarRecordatorio(){
    String texto = _textController.text;
    if (texto.isNotEmpty){
      setState((){
        _recordatorios.add(texto);
        _textController.clear();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recordatorios'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nuevo recordatorio',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _agregarRecordatorio,
            child: Text('Agregar'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _recordatorios.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(_recordatorios[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}