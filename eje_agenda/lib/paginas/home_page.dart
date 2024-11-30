import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int indicePagina = 0;
  //final List<String> _recordatorios = [];
  //final TextEditingController _textController = TextEditingController();

  /*void _agregarRecordatorio(){
    String texto = _textController.text;
    if (texto.isNotEmpty){
      setState((){
        _recordatorios.add(texto);
        _textController.clear();
      });
    }
  }*/
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int indice){
          setState((){
            indicePagina = indice;
          });
        },
        indicatorColor: Colors.cyanAccent,
        selectedIndex: indicePagina,
        destinations: const<Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.chrome_reader_mode),
            icon: Icon(Icons.chrome_reader_mode_outlined),
            label: 'Todos',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.format_list_bulleted_add)),
            label: 'Hoy',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('4'),
              child: Icon(Icons.heart_broken_outlined),
            ),
            label: 'Favoritos',
          ),
        ],
      ),

      /*appBar: AppBar(
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
      ),*/
    );
    
  }
}