#import <Headers/Interfaces.h>
@import WebKit;

static NSArray* trustedRepos = @[
    @"https://repounclutter.coolstar.org/",
    @"https://repo.chariz.io/",
    @"https://repo.packix.com/",
    @"https://www.yourepo.com/",
    @"http://thebigboss.org/",
    @"http://apt.saurik.com/",
    @"http://cydia.zodttd.com/"
];

static BOOL urlEqual(NSString* host1, NSString* host2) {
    NSMutableArray<NSString*>* comp1 = [[host1 componentsSeparatedByString:@"."] mutableCopy];
    NSMutableArray<NSString*>* comp2 = [[host2 componentsSeparatedByString:@"."] mutableCopy];

    if (comp1.count) [comp1 removeObjectAtIndex:0];
    if (comp2.count) [comp2 removeObjectAtIndex:0];

    host1 = [comp1 componentsJoinedByString:@""];
    host2 = [comp2 componentsJoinedByString:@""];

    return [host1 isEqualToString:host2];
}

static BOOL isSafe(WKWebView* webView) {
    if ([prefs boolForKey:@"allJSEnabled"]) return YES;
    PackageViewController* vc = (PackageViewController*)[webView _viewControllerForAncestor];
    if ([vc isKindOfClass:%c(PackageViewController)]) {
        Package* package = vc.package;
        Repo* repo = [package sourceRepo];
        NSURL* repoURL = [NSURL URLWithString:repo.repoURL];
        for (NSString* repoAddr in trustedRepos) {
            NSURL* url = [NSURL URLWithString:repoAddr];
            NSString* host1 = url.host;
            NSString* host2 = repoURL.host;
            if (urlEqual(host1, host2)) {
                return YES;
            }
        }
    }
    return NO;
}

%hook WKWebView
-(void)didMoveToWindow {
    %orig;
    WKWebViewConfiguration* config = [self configuration];
    if (isSafe(self)) {
        config.preferences.javaScriptEnabled = YES;
    }
}
%end
