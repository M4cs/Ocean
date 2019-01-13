#import <Headers/Interfaces.h>

CGFloat warningHeight = 0;

%group Warnings
%hook PackageViewController
-(void)viewDidLayoutSubviews {
    %orig;
    UIView* warningView = [(NSObject*)self valueForKey:@"_deprecatedWarningView"];
    warningHeight = warningView.frame.size.height;
    [warningView removeFromSuperview];

    UIView* webView = [(NSObject*)self valueForKey:@"_depictionWebView"];
    webView.frame = CGRectMake(0, webView.frame.origin.y - warningHeight, webView.frame.size.width, webView.frame.size.height);

    UIView* footerView = [(NSObject*)self valueForKey:@"_depictionFooterView"];
    footerView.frame = CGRectMake(0, footerView.frame.origin.y - warningHeight, footerView.frame.size.width, footerView.frame.size.height);
}
%end

%hook UIScrollView
-(void)setContentSize:(CGSize)arg1 {
    if ([self isMemberOfClass:[UIScrollView class]] && [[self _viewControllerForAncestor] isKindOfClass:%c(PackageViewController)]) {
        arg1 = CGSizeMake(arg1.width, arg1.height - warningHeight);
    }
    %orig;
}
%end
%end

%ctor {
    if ([prefs boolForKey:@"hideWarnings"]) {
        %init(Warnings);
    }
}
