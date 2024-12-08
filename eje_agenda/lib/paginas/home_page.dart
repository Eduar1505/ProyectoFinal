import 'package:flutter/material.dart';
import 'package:eje_agenda/database/db_helper.dart';
import 'package:eje_agenda/paginas/agregar_tareas.dart';
import 'package:eje_agenda/paginas/tarea.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indicePagina = 0;
  List<Tarea> tareas = [];

  @override
  void initState() {
    super.initState();
    _cargarTareas();
  }

  Future<void> _cargarTareas() async {
    final todasTareas = await DatabaseHelper().getTareas();
    setState(() {
      tareas = todasTareas;
    });
  }

  List<Tarea> _filtrarTareas() {
    DateTime hoy = DateTime.now();
    switch (indicePagina) {
      case 1: // Hoy
        return tareas.where((t) =>
            t.fecha.year == hoy.year &&
            t.fecha.month == hoy.month &&
            t.fecha.day == hoy.day).toList();
      case 2: // Favoritos
        return tareas.where((t) => t.esFavorito).toList();
      default: // Todos
        return tareas;
    }
  }

  Future<void> _editarTarea(Tarea tarea) async {
    final tareaEditada = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgregarTareas(tarea: tarea),
      ),
    );
    if (tareaEditada != null) _cargarTareas();
  }

  Future<void> _eliminarTarea(int id) async {
    await DatabaseHelper().deleteTarea(id);
    _cargarTareas();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tarea eliminada con éxito')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tareasFiltradas = _filtrarTareas();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nuevaTarea = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AgregarTareas(),
            ),
          );
          if (nuevaTarea != null) _cargarTareas();
        },
        backgroundColor: Colors.black38,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black38,
        onDestinationSelected: (indice) {
          setState(() => indicePagina = indice);
        },
        selectedIndex: indicePagina,
        indicatorColor: const Color.fromARGB(255, 139, 139, 139),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list, color: Colors.white),
            label: 'Todos',
          ),
          NavigationDestination(
            icon: Icon(Icons.today, color: Colors.white),
            label: 'Hoy',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite, color: Colors.white),
            label: 'Favoritos',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: tareasFiltradas.isEmpty
            ? const Center(child: Text('No hay tareas disponibles'))
            : ListView.builder(
                itemCount: tareasFiltradas.length,
                itemBuilder: (context, index) {
                  final tarea = tareasFiltradas[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        tarea.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tarea.descripcion ?? 'Sin descripción',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'Fecha: ${tarea.fecha.toLocal()}  Hora: ${tarea.hora.format(context)}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert),
                        onSelected: (valor) {
                          if (valor == 'editar') _editarTarea(tarea);
                          if (valor == 'eliminar') _eliminarTarea(tarea.id!);
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'editar',
                            child: Text('Editar'),
                          ),
                          const PopupMenuItem(
                            value: 'eliminar',
                            child: Text('Eliminar'),
                          ),
                        ],
                      ),
                      leading: tarea.esFavorito
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.task),
                    ),
                  );
                },
              ),
      ),
    );
  }
}