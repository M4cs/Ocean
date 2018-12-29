#include "./Headers/OCPProvider.h"

@implementation OCPProvider

#pragma mark Initialization

+ (CSPreferencesProvider *)sharedProvider {
    static dispatch_once_t once;
    static CSPreferencesProvider *sharedProvider;
    dispatch_once(&once, ^{

        NSString *tweakId = @"com.midnightchips.oceanprefs";
        NSString *prefsNotification = [tweakId stringByAppendingString:@".prefschanged"];
        NSString *defaultsPath = @"/Library/PreferenceBundles/oceanprefs.bundle/defaults.plist";

        sharedProvider = [[CSPreferencesProvider alloc] initWithTweakID:tweakId defaultsPath:defaultsPath postNotification:prefsNotification notificationCallback:^void (CSPreferencesProvider *provider) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"OCPSettingsChanged" object:nil userInfo:nil];
        }];

    });
    return sharedProvider;
}

@end
