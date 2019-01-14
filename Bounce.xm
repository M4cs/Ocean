#import <Headers/Interfaces.h>

%hook UIScrollView
-(void)didMoveToWindow
{
    %orig;
    if ([self isMemberOfClass:[UIScrollView class]] && [[self _viewControllerForAncestor] isKindOfClass:%c(PackageViewController)])
    {
        self.alwaysBounceVertical = YES;
    }
}
%end
