import 'package:flutter/material.dart';
import 'package:supabaseeuy/catatan.dart';
import 'package:supabaseeuy/catatan_database.dart';

class HalamanCatatan extends StatefulWidget {
  const HalamanCatatan({super.key});

  @override
  State<HalamanCatatan> createState() => _HalamanCatatanState();
}

class _HalamanCatatanState extends State<HalamanCatatan> {
  final catatanDatabase = CatatanDatabase();
  final catatanController = TextEditingController();

  void addNewCatatan() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Catatan Baru"),
        content: TextField(
          controller: catatanController,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              catatanController.clear();
            },
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              final newCatatan = Catatan(content: catatanController.text);
              catatanDatabase.createCatatan(newCatatan);
              Navigator.pop(context);
              catatanController.clear();
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  void updateCatatan(Catatan catatan) {
    catatanController.text = catatan.content;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Catatan"),
        content: TextField(
          controller: catatanController,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              catatanController.clear();
            },
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              
              catatanDatabase.updateCatatan(catatan, catatanController.text);
              Navigator.pop(context);
              catatanController.clear();
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  void hapusCatatan(Catatan catatan) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Hapus Catatan"),
        
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              catatanController.clear();
            },
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              catatanDatabase.deleteCatatan(catatan);
              Navigator.pop(context);
              catatanController.clear();
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catatan App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewCatatan,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: catatanDatabase.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final catatann = snapshot.data!;

          return ListView.builder(
            itemCount: catatann.length,
            itemBuilder: (context, index) {
              final catatan = catatann[index];

              return ListTile(
                title: Text(catatan.content),
                trailing: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          updateCatatan(catatan);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          hapusCatatan(catatan);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
