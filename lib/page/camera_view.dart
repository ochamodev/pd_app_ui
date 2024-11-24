
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:recycling_pal/page/preview_page.dart';


class CameraView extends StatefulWidget {
  final List<CameraDescription>? cameras;

  const CameraView({super.key, required this.cameras});

  @override
  State<StatefulWidget> createState() {
    return _CameraViewState();
  }

}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  late CameraController _cameraController;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController cameraController = _cameraController;

    // App state changed before we got the chance to initialize.
    if (!cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initCamera(cameraController.description);
    }
  }

  @override
  void initState() {
    super.initState();
    _initCamera(widget.cameras![0]);
  }

  Future _initCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
        cameraDescription,
        ResolutionPreset.high
    );

    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {

        });
      });
    } on CameraException catch(e) {
      print("Camera error $e");
    }

  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }

    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewPage(picture: picture)
        )
      );
    } on CameraException catch(e) {
      print("Error occured while taking picture: $e");
      return null;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Capturar imagen"),
      ),
      body: Stack(
        children: [
          (_cameraController.value.isInitialized)
          ? CameraPreview(_cameraController)
          : Container(
            color: Colors.black,
            child: const Center(child: CircularProgressIndicator()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Colors.black)
              ,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: IconButton(
                        onPressed: takePicture,
                        iconSize: 80,
                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 50, top: 0),
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.circle, color: Colors.white),
                      )
                  ),
                ],
              ),
            ),
          )
        ]
      ),
    );
  }

}
