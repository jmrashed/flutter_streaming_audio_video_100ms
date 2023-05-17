//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<camera_avfoundation/CameraPlugin.h>)
#import <camera_avfoundation/CameraPlugin.h>
#else
@import camera_avfoundation;
#endif

#if __has_include(<flutter_audio_recorder/FlutterAudioRecorderPlugin.h>)
#import <flutter_audio_recorder/FlutterAudioRecorderPlugin.h>
#else
@import flutter_audio_recorder;
#endif

#if __has_include(<permission_handler_apple/PermissionHandlerPlugin.h>)
#import <permission_handler_apple/PermissionHandlerPlugin.h>
#else
@import permission_handler_apple;
#endif

#if __has_include(<video_player_avfoundation/FLTVideoPlayerPlugin.h>)
#import <video_player_avfoundation/FLTVideoPlayerPlugin.h>
#else
@import video_player_avfoundation;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [CameraPlugin registerWithRegistrar:[registry registrarForPlugin:@"CameraPlugin"]];
  [FlutterAudioRecorderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterAudioRecorderPlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
  [FLTVideoPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTVideoPlayerPlugin"]];
}

@end
