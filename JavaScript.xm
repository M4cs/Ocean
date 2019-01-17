#import <Headers/Interfaces.h>
@import WebKit;

static void warningAlert(id self, NSString* message) {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Warning" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:ok];
    [(UIViewController*)self presentViewController:alert animated:YES completion:nil];
}

%group JavaScript
%hook WKWebView
-(void)layoutSubviews {
    %orig;
    [self reload];
}
%end

%hook WKPreferences
-(void)setJavaScriptEnabled:(BOOL)arg1 {
    arg1 = YES;
    %orig;
}

-(BOOL)javaScriptEnabled {
    return YES;
}
%end

%hook FeaturedViewController
-(void)viewDidAppear:(BOOL)arg1 {
    %orig;
    BOOL alertShown = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ocean_jsWarningShown"] boolValue];
    if (!alertShown) {
        warningAlert(self, @"JavaScript is currently enabled for all repos, this means repos can show you ads and potentially malware. If you want to disable this feature, you can do so from Ocean's settings page.");
        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"ocean_jsWarningShown"];
    }
}
%end
%end

%ctor {
    if ([prefs boolForKey:@"enableJS"]) {
        %init(JavaScript);
    }
}
