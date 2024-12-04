
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycling_pal/page/classification_page.dart';
import 'package:recycling_pal/state/app_notifier.dart';
import 'package:recycling_pal/state/app_state.dart';

class PreviewPage extends ConsumerStatefulWidget {
  const PreviewPage({super.key, required this.picture});

  final XFile picture;

  @override
  ConsumerState<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends ConsumerState<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    final AppNotifier notifier = ref.read(appNotifierProvider.notifier);
    final state = ref.watch(appNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Vista previa')),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Center(
                  child: Image.file(File(widget.picture.path), fit: BoxFit.fill, width: MediaQuery.sizeOf(context).width * 0.70),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: state.loading ? null : () async {
                    notifier.setLoading(true);
                    await notifier.classifyImage(widget.picture.path,
                        widget.picture.name);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) {
                          return ClassificationPage(picture: widget.picture);
                        })
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor
                  ),
                  child: state.loading ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ) : Text(
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