import 'package:eje_agenda/paginas/agregar_tareas.dart';
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
    // ignore: unused_local_variable
    final ThemeData theme = Theme.of(context);
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // ignore: unused_local_variable
          final nuevaTarea = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgregarTareas(),),);
        },

        backgroundColor: Colors.black38,
        child: const Icon(Icons.add_to_photos, color: Colors.white),
        // label: 'Agregar',
      ),

      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black38,
        onDestinationSelected: (int indice){
          setState((){
            indicePagina = indice;
          });
        },
        indicatorColor: const Color.fromARGB(255, 139, 139, 139),
        // shadowColor: Colors.blue,

        selectedIndex: indicePagina,
        destinations: const<Widget>[
          NavigationDestination(
            // selectedIcon: Icon(Icons.chrome_reader_mode),
            icon: Icon(Icons.chrome_reader_mode_outlined, color: Colors.white,),
            label: 'Todos',
            
          ),
          NavigationDestination(
            icon: Icon(Icons.format_list_bulleted_add, color: Colors.white,),
            label: 'Hoy',
            // labelStyle: TextStyle(color: Color())
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite, color: Colors.white,),
            label: 'Favoritos',
          ),
        ],
        
      ),

      body: <Widget>[
        //TODAS LAS TAREAS
        Card(
          shadowColor: Colors.transparent,
          margin: conts EdgeInsets.all(8.0),
          child: SisedBox.expand(
            child: Text("Todas las tareas", style: theme.textTheme.titleLarge),
          ),
        ),
        //TAREAS HOY
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text("Ponete las pilas chele"),
                  subtitle: Text("Mandame la funcion"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text("Ponete las pilas chele"),
                  subtitle: Text("Mandame la funcion pero ya jajaja"),
                ),
              ),
            ],
          ),
        ),
        //TAREAS FAVORITAS
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text("Ponete las pilas Emerson"),
                  subtitle: Text("termina la pantalla de inicio"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text("Ponete las pilas Emerson"),
                  subtitle: Text("Mandame la funcion pero ya jajaja"),
                ),
              ),
            ],
          ),
        ),
      ],
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