import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming Audio and Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraController _cameraController;
  VideoPlayerController _videoPlayerController;
  FlutterAudioRecorder _audioRecorder;
  Recording _currentRecording;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
    initializeVideoPlayer();
    initializeAudioRecorder();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
    );

    await _cameraController.initialize();

    setState(() {});
  }

  void initializeVideoPlayer() {
    _videoPlayerController = VideoPlayerController.network(
      'YOUR_VIDEO_URL',
    );

    _videoPlayerController.initialize().then((_) {
      setState(() {});
    });
  }

  Future<void> initializeAudioRecorder() async {
    await Permission.microphone.request();

    final hasPermission = await Permission.microphone.isGranted;
    if (!hasPermission) {
      throw PlatformException(
        code: 'PERMISSION_DENIED',
        message: 'Microphone permission denied',
      );
    }

    final directory = await getApplicationDocumentsDirectory();
    final filePath = directory.path + '/recording.aac';

    _audioRecorder = FlutterAudioRecorder(
      filePath,
      audioFormat: AudioFormat.AAC,
    );

    await _audioRecorder.initialized;

    setState(() {});
  }

  Future<void> startRecording() async {
    await _audioRecorder.start();
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> stopRecording() async {
    final recording = await _audioRecorder.stop();
    setState(() {
      _currentRecording = recording;
      _isRecording = false;
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streaming Audio and Video'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _cameraController != null && _cameraController.value.isInitialized
                ? CameraPreview(_cameraController)
                : Container(),
          ),
          Expanded(
            child: _videoPlayerController != null && _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: RaisedButton(
              onPressed: _isRecording ? stopRecording : startRecording,
              child: Text(_isRecording ? 'Stop Recording' : 'Start Recording'),
            ),
          ),
          _currentRecording != null
              ? Text('Recording saved to: ${_currentRecording.path}')
              : Container(),
        ],
      ),
    );
  }
}
