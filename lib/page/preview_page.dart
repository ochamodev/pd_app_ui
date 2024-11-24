
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key, required this.picture});

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vista previa')),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Center(
                  child: Image.file(File(picture.path), fit: BoxFit.fill, width: MediaQuery.sizeOf(context).width * 0.70),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor
                  ),
                  child: Text(
                    "Clasificar",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Text("Menu principal")
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondary
                    ),
                    child: Text(
                      "Tomar foto nuevamente",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary
                      ),
                    )
                ),
              ]),
        ),
      ),
    );
  }
}