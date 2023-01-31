#import "BetterPlayerAwesomePlugin.h"
#if __has_include(<better_player_awesome/better_player_awesome-Swift.h>)
#import <better_player_awesome/better_player_awesome-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "better_player_awesome-Swift.h"
#endif

@implementation BetterPlayerAwesomePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBetterPlayerAwesomePlugin registerWithRegistrar:registrar];
}
@end
