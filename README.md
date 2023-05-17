# Flutter Streaming Audio Video 100ms

Flutter Streaming Audio Video 100ms is a Flutter package that allows you to stream audio and video data with a latency of 100ms.

## Features

- Low-latency streaming of audio and video data.
- Supports real-time communication applications, such as video conferencing, live streaming, and more.
- Easy-to-use API for integrating with your Flutter applications.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_streaming_audio_video_100ms: ^1.0.0
```

Then, `run flutter pub get` to fetch the package.

# Note
Please note that you'll need to replace `YOUR_VIDEO_URL` with the actual URL of the video you want to stream. Also, make sure to import the necessary packages (`camera`, `flutter_audio_recorder`, `permission_handler`, and `video_player`) in your `pubspec.yaml` file and run `flutter pub get` to fetch the dependencies before running the code

# Usage
Import the package into your Dart code:
```dart 
import 'package:flutter_streaming_audio_video_100ms/flutter_streaming_audio_video_100ms.dart';
```

Here's a basic example of how to use the package:

```dart
// Create an instance of the streaming client
StreamingClient client = StreamingClient();

// Connect to the streaming server
client.connect('your_server_address');

// Start streaming audio and video
client.startStreaming();

// Receive audio and video data
client.onAudioData.listen((audioData) {
  // Handle the received audio data
});

client.onVideoData.listen((videoData) {
  // Handle the received video data
});

// Stop streaming
client.stopStreaming();

// Disconnect from the streaming server
client.disconnect();

```


Please refer to the package documentation for more detailed information on the available methods and events.

# Contributing
Contributions are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.  Feel free to customize the content based on your package's specific details and requirements.


# License
This package is released under the MIT License. See the LICENSE file for more details.
