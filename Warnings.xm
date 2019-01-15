#import <Headers/Interfaces.h>
@import WebKit;

CGFloat warningHeight = 0;

%group Warnings
%hook UIView
-(void)layoutSubviews
{
    %orig;
    if ([self isMemberOfClass:[UIView class]])
    {
        if ([[self _viewControllerForAncestor] isKindOfClass:%c(PackageViewController)])
        {
            if (self.subviews.count == 1)
            {
                if ([self.subviews[0] isMemberOfClass:[UILabel class]])
                {
                    if (self.frame.size.width == ((UIViewController*)[self _viewControllerForAncestor]).view.frame.size.width)
                    {
                        if ([self.superview.superview isMemberOfClass:[UIScrollView class]])
                        {
                            //right that should be enough fucking checks
                            //pretty sure we're the deprecated warning
                            warningHeight = self.frame.size.height;
                            [self removeFromSuperview];
                        }
                    }
                }
            }
        }
    }
}
%end

%hook WKWebView
-(void)setFrame:(CGRect)arg1
{
    if ([[self _viewControllerForAncestor] isKindOfClass:%c(PackageViewController)])
    {
        arg1 = CGRectMake(0, arg1.origin.y - warningHeight, arg1.size.width, arg1.size.height);
    }
    %orig;
}
%end

%hook DepictionStackView
-(void)setFrame:(CGRect)arg1
{
    if ([[(UIView*)self _viewControllerForAncestor] isKindOfClass:%c(PackageViewController)])
    {
        PackageViewController* vc = (PackageViewController*)[(UIView*)self _viewControllerForAncestor];
        if ([vc valueForKey:@"_depictionFooterView"] == self)
        {
            arg1 = CGRectMake(0, arg1.origin.y - warningHeight, arg1.size.width, arg1.size.height);
        }
    }
    %orig;
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
