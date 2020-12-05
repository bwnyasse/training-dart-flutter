#import "MybatterylevelPlugin.h"
#if __has_include(<mybatterylevel/mybatterylevel-Swift.h>)
#import <mybatterylevel/mybatterylevel-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mybatterylevel-Swift.h"
#endif

@implementation MybatterylevelPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMybatterylevelPlugin registerWithRegistrar:registrar];
}
@end
