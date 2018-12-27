#define kColor [UIColor colorWithRed:1.00 green:0.25 blue:0.00 alpha:1.0];

#import "Headers/ANEMWebImageButton.h"

@interface __FakeMarqueeLabel : UILabel
@end

@interface SourceProgressIndicatorView : UIView
@end

%hook UIImageView
-(void)_setDefaultRenderingMode:(long long)arg1{
	if([self.superview isKindOfClass:NSClassFromString(@"ANEMWebImageButton")]){
		arg1 = 2;
		%orig(arg1);
	}
	%orig(arg1);
}
-(void)setTintColor:(UIColor *)arg1{
	if([self.superview isKindOfClass:NSClassFromString(@"ANEMWebImageButton")]){
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
%hook UISegmentedControl
-(void)setTintColor:(UIColor *)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
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
%hook __FakeMarqueeLabel
-(void)layoutSubviews{
    %orig;
    self.textColor = [UIColor colorWithRed:0.10 green:0.10 blue:0.20 alpha:1.0];
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