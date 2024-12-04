
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycling_pal/state/app_notifier.dart';

class ClassificationPage extends ConsumerStatefulWidget {
  const ClassificationPage({super.key, required this.picture});

  final XFile picture;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ClassificationPageState();

}

class ClassificationPageState extends ConsumerState<ClassificationPage> {
  @override
  Widget build(BuildContext context) {
    var state = ref.read(appNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Clasificación"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Center(
                child: Image.file(File(widget.picture.path), fit: BoxFit.fill, width: MediaQuery.sizeOf(context).width * 0.65),
              ),
              const SizedBox(height: 24),
              Text(
                style: Theme.of(context).textTheme.headlineSmall,
                "Resultado hugging face"
              ),
              Text("Clasificación: ${state.huggingFaceMaterial}"),
              const SizedBox(height: 24,),
              Text(
                  style: Theme.of(context).textTheme.headlineSmall,
                  "Resultado nuestro modelo"
              ),
              Text("Clasificación: ${state.pytorchClassification}"),
              Text("Material: ${state.pytorchMaterial}"),
              const SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );
  }

}
