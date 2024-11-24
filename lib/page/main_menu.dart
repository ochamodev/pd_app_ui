
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recycling_pal/page/camera_view.dart';

class MainMenu extends ConsumerWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido a Recycler Pal"),
      ),
      body: _MainMenuBody(),
    );
  }
  
}

class _MainMenuBody extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainMenuBodyState();

}

class _MainMenuBodyState extends ConsumerState<_MainMenuBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  _requestCameraPermission();
                },
                icon: const Icon(
                    Icons.camera_alt_outlined
                ),
                color: Theme
                    .of(context)
                    .primaryColor,
                iconSize: 80.0,
              ),
              Text("Identificar")
            ],
          ),
        ),
      ),
    );
  }

  void _requestCameraPermission() async {
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      var newStatus = await Permission.camera.request();
      if (newStatus.isGranted) {
        _openCameraView();
      }
    } else {
      _openCameraView();
    }
  }

  void _openCameraView() async {
    availableCameras().then((value) {
      Navigator.push(context, MaterialPageRoute(
          builder: (_) => CameraView(cameras: value)
      ));
    });
  }
}
