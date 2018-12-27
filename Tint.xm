#define kColor [UIColor colorWithRed:1.00 green:0.25 blue:0.00 alpha:1.0];

#import "Headers/ANEMWebImageButton.h"

@interface __FakeMarqueeLabel : UILabel
@property(nonatomic, retain) UIColor *textColor;
@property(nonatomic, copy) NSString *text;
@end

@interface SourceProgressIndicatorView : UIView
@end

%hook UIImageView
-(long long)_defaultRenderingMode{
	if([self.superview isKindOfClass:NSClassFromString(@"ANEMWebImageButton")] || [self.superview isKindOfClass:NSClassFromString(@"PackageListHeader")]){
		return 2;
	}
	return %orig;
}
-(void)setTintColor:(UIColor *)arg1{
	if([self.superview isKindOfClass:NSClassFromString(@"ANEMWebImageButton")] || [self.superview isKindOfClass:NSClassFromString(@"PackageListHeader")]){
		arg1 = [UIColor blueColor];
		%orig(arg1);
	}
	%orig(arg1);
}
%end
%hook UITableView
-(void)setSeparatorColor:(UIColor *)arg1{
    arg1 = kColor;
    %orig(arg1);
}
%end
%hook UINavigationBar
-(void)setTintColor:(UIColor *)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook UINavigationButton
-(void)setTintColor:(UIColor *)arg1{
    arg1 = kColor;
    %orig(arg1);
}
%end
// %hook UISegmentedControl
// -(void)setTintColor:(UIColor *)arg1 {
//     for (UIView *subview in self.subviews) {
//         subview.tintColor = kColor;
//         for (UIView *subsubview in subview.subviews) {
//             subsubview.tintColor = kColor;
//         }
//     }
// }
// %end
// %hook UISegment
// -(void)setTintColor:(id)arg1{
// 	arg1 = kColor;
// 	%orig(arg1);
// }
// %end
%hook SourceProgressIndicatorView
-(void)setTintColor:(UIColor *)arg1 {
    arg1 = kColor;
    %orig(arg1);
}
%end
%hook UITabBar
-(void)setTintColor:(UIColor *)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook PackageQueueButton
-(void)setBackgroundColor:(id)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook FeaturedButton
-(void)setTitleColor:(id)arg1 forState:(unsigned long long)arg2 {
	arg1 = kColor;
	%orig(arg1, arg2);
}
%end
%hook DownloadConfirmButton
-(void)setBackgroundColor:(id)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook UIButton
-(void)setTitleColor:(id)arg1 forState:(unsigned long long)arg2 {
	arg1 = kColor;
	%orig(arg1, arg2);
}
%end
%hook DepictionTableButtonView
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_titleLabel"]){
        UILabel *titleLabel = (UILabel *)[self valueForKey:@"_titleLabel"];
        titleLabel.textColor = kColor;
    }
}
%end
@interface DepictionTabControl : UIView
@property(nonatomic) _Bool highlighted; 
@end
%hook DepictionTabControl
- (void)layoutSubviews {
	%orig;
	if (self.highlighted){
		if ([self valueForKey:@"_tabLabel"]) {
			UILabel *tabLabel = (UILabel *)[self valueForKey:@"_tabLabel"];
        	tabLabel.textColor = kColor;
    	}
	}
}
%end
%hook DepictionTabView
-(void)layoutSubviews {
	%orig;
	if ([self valueForKey:@"_tabViewHighlight"]) {
		UIView *tabViewHighlight = (UIView *)[self valueForKey:@"_tabViewHighlight"];
        tabViewHighlight.backgroundColor = kColor;
    }
}
%end 
%hook UITabBarButton //This sets the color for any badge that belongs to a TabBarIcon.
-(void)layoutSubviews{
    %orig;
    UIView *badge = MSHookIvar<UIView*>(self, "_badge");
    badge.backgroundColor = kColor;
}
%end