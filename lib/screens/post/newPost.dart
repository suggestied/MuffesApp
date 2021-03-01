import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:muffesapp/utils/components/bottomNavBar.dart';

List<CameraDescription> cameras;

class newPost extends StatefulWidget {
  newPost({Key key}) : super(key: key);

  @override
  _newPostState createState() => _newPostState();
}

class _newPostState extends State<newPost> {
  CameraController cController;
  var _isReady = false;
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    _setupCameras();
  }

  Future<void> _setupCameras() async {
    try {
      // initialize cameras.
      cameras = await availableCameras();
      // initialize camera controllers.
      cController = new CameraController(cameras[0], ResolutionPreset.medium);
      await cController.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  @override
  void dispose() {
    cController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: customBottomNavBar(),
      body: _isReady == true
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: AspectRatio(
                  aspectRatio: cController.value.aspectRatio,
                  child: CameraPreview(cController)),
            )
          : Container(),
    );
  }
}
