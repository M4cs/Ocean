//#define kColor [UIColor colorWithRed:1.00 green:0.25 blue:0.00 alpha:1.0];

#import "Headers/ANEMWebImageButton.h"

#import <Headers/Interfaces.h>

%group Tint
%hook UIImageView
-(long long)_defaultRenderingMode{
	if([self.superview isKindOfClass:NSClassFromString(@"ANEMWebImageButton")] || [self.superview.superview isKindOfClass:%c(PackageListHeader)]){
		return 2;
	}
	return %orig;
}
-(void)setTintColor:(UIColor *)arg1{
	if([self.superview isKindOfClass:NSClassFromString(@"ANEMWebImageButton")] || [self.superview.superview isKindOfClass:%c(PackageListHeader)] || [self.superview isKindOfClass:%c(DepictionTableButtonView)]){
		arg1 = [prefs colorForKey:@"tintColor"];
		%orig(arg1);
	}
	%orig(arg1);
}
%end
%hook UINavigationBar
-(void)setTintColor:(UIColor *)arg1{
	arg1 = [prefs colorForKey:@"tintColor"];
	%orig(arg1);
}
%end
%hook UINavigationButton
-(void)setTintColor:(UIColor *)arg1{
    arg1 = [prefs colorForKey:@"tintColor"];
    %orig(arg1);
}
%end
%hook UISegmentedControl
-(void)layoutSubviews {
	%orig;
	self.tintColor = [prefs colorForKey:@"tintColor"];
}
%end
%hook SourceProgressIndicatorView
-(void)setTintColor:(UIColor *)arg1 {
    arg1 = [prefs colorForKey:@"tintColor"];
    %orig(arg1);
}
%end
%hook UITabBar
-(void)setTintColor:(UIColor *)arg1{
	arg1 = [prefs colorForKey:@"tintColor"];
	%orig(arg1);
}
%end
%hook PackageQueueButton
-(void)setBackgroundColor:(id)arg1{
	arg1 = [prefs colorForKey:@"tintColor"];
	%orig(arg1);
}
%end
%hook FeaturedButton
-(void)setTitleColor:(id)arg1 forState:(unsigned long long)arg2 {
	arg1 = [prefs colorForKey:@"tintColor"];
	%orig(arg1, arg2);
}
%end
%hook DownloadConfirmButton
-(void)setBackgroundColor:(id)arg1{
	arg1 = [prefs colorForKey:@"tintColor"];
	%orig(arg1);
}
%end
%hook UIButton
-(void)setTitleColor:(id)arg1 forState:(unsigned long long)arg2 {
	if (![self isKindOfClass:%c(PackageQueueButton)]) {
		arg1 = [prefs colorForKey:@"tintColor"];
	} else {
		arg1 = [UIColor whiteColor];
	}
	%orig(arg1, arg2);
}

-(void)layoutSubviews {
	%orig;
	if ([self.superview isKindOfClass:%c(PackageListHeader)]) {
		self.tintColor = [prefs colorForKey:@"tintColor"];
	}
}
%end
%hook DepictionTableButtonView
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_titleLabel"]){
        UILabel *titleLabel = (UILabel *)[self valueForKey:@"_titleLabel"];
        titleLabel.textColor = [prefs colorForKey:@"tintColor"];
    }
}
%end
@interface DepictionTabControl : UIView
@property(nonatomic) _Bool highlighted;
@end
%hook UILabel
-(void)setTextColor:(id)arg1 {
	if ([self.superview isMemberOfClass:%c(DepictionTabControl)]) {
		DepictionTabControl* tabControl = (DepictionTabControl*)self.superview;
		if (tabControl.highlighted) {
			arg1 = [prefs colorForKey:@"tintColor"];
		}
	}
	%orig;
}
%end
%hook UITabBarButton //This sets the color for any badge that belongs to a TabBarIcon.
-(void)layoutSubviews{
    %orig;
    UIView *badge = MSHookIvar<UIView*>(self, "_badge");
    badge.backgroundColor = [prefs colorForKey:@"tintColor"];
}
%end
%hook UITableView
-(void)layoutSubviews {
    %orig;
    self.tintColor = [prefs colorForKey:@"tintColor"];
}
%end
%hook CSTextRenderView
-(void)layoutSubviews {
    %orig;
    self.tintColor = [prefs colorForKey:@"tintColor"];
}
%end
%hook UIView
-(void)setBackgroundColor:(id)arg1 {
	if ([self.superview.superview isKindOfClass:%c(DepictionTabView)]) {
		id tabView = self.superview.superview;
		if ([tabView valueForKey:@"_tabViewHighlight"]) {
			UIView *tabViewHighlight = (UIView *)[tabView valueForKey:@"_tabViewHighlight"];
			if (tabViewHighlight == self) {
				arg1 = [prefs colorForKey:@"tintColor"];
			}
		}
	}
	%orig;
}
%end
%end

%ctor {
	if ([prefs boolForKey:@"tintEnabled"]) {
        %init(Tint);
    }
}
